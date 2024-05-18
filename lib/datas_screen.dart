import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uts_test/FormScreen/editscreen.dart';
import 'package:uts_test/FormScreen/formScreen.dart';

import 'package:uts_test/dto/datas.dart';
import 'package:uts_test/endpoint/endpoints.dart';

import 'package:uts_test/services/data_service.dart';

class DatasScreen extends StatefulWidget {
  const DatasScreen({Key? key}) : super(key: key);

  @override
  _DatasScreenState createState() => _DatasScreenState();
}

class _DatasScreenState extends State<DatasScreen> {
  Future<List<Datas>>? _datas;

  @override
  void initState() {
    super.initState();
    _datas = DataService.fetchDatas();
  }
void navigateToEditScreen(Datas datas) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => EditScreen(object: datas),
    ),
  );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Data List'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); // Kembali ke halaman sebelumnya
          },
        ),
      ),
      body: FutureBuilder<List<Datas>>(
        future: _datas,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final item = data[index];
                return ListTile(
                  title: item.imageUrl != null
                      ? Row(
                          children: [
                            Image.network(
                              fit: BoxFit.fitWidth,
                              width: 350,
                              Uri.parse(
                                      '${Endpoints.baseURLLive}/public/${item.imageUrl!}')
                                  .toString(),
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(Icons.error),
                            ),
                          ],
                        )
                      : null,
                  subtitle: Column(children: [
                    Text('Name : ${item.name}',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: const Color.fromARGB(255, 36, 31, 31),
                          fontWeight: FontWeight.normal,
                        )),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            _showDeleteConfirmationDialog(context, item);
                          },
                          icon: Icon(Icons.delete),
                        ),
                        IconButton(
                          onPressed: () {
                            navigateToEditScreen(item);
                          },
                          icon: Icon(Icons.edit),
                        ),
                      ],
                    )
                  ]),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('${snapshot.error}'));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const FormScreenApi()));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> _showDeleteConfirmationDialog(
      BuildContext context, Datas datas) async {
    final bool confirmed = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete Data'),
        content: Text('Are you sure you want to delete this ${datas.name}?'),
        actions: [
          TextButton(
            onPressed: () {
              // Tidak jadi menghapus, kembali dengan nilai false
              Navigator.of(context).pop(false);
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              // Konfirmasi untuk menghapus, kembali dengan nilai true
              Navigator.of(context).pop(true);
            },
            child: Text('Delete'),
          ),
        ],
      ),
    );

    // Jika pengguna mengonfirmasi penghapusan, lanjutkan penghapusan
    if (confirmed) {
      try {
        // Memanggil metode deleteDatas untuk menghapus data dengan ID tertentu
        await DataService.deleteDatas(datas.idDatas);
        // Refresh data setelah berhasil menghapus
        setState(() {
          _datas = DataService.fetchDatas();
        });
        // Tampilkan snackbar atau pesan berhasil dihapus
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Data deleted successfully'),
          ),
        );
      } catch (e) {
        // Tangani kesalahan jika gagal menghapus data
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to delete data: $e'),
          ),
        );
      }
    }
  }
}