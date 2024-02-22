# 15/9/2023
- Data resource from REST API
- Data yang sudah diparsing :
    - Master Asset : Preventive & Reguler (Torque dan Verticality)
    - Master Checklist (Report Preventive)
    - Master Torque (Report Reguler)
- Camera update and fixing (belum bisa picking image)
- State management Riverpod untuk Authentication dan Get Data
- Update icon apps, name and package
# 18/9/2023
- implementasi isar part (1)
# 20/9/2023
- add asset db dan checklist db
# 21/9/2023
- add params indexOrder untuk preventive db
# 22/9/2023
- add report torque db
# 27/9/2023
- pick from album and save to local asset db
- compare local db and rest when open apps after login, when rest add new task, local insert new one. but when rest delete task, local delete too
# 06/10/2023
- update detail task screen -> custom scroll view with sliver
- add temuan button
- Uploading File to Server
- Update local database by ID
# 11/10/2023
- update taskcontrollerprovider untuk mengakomodir set url pada asset menu
# 18/10/2023
- update add temuan dynamically (done)
# 24/10/2023
- upload asset, upload/update task, reload task from REST API
- update : save report checklist
- update : save report torque
- update : save report verticality
# 01/11/2023
- upload asset, ceklist prev, ceklis reg verticality, ceklist torque
- load data from REST API after submit 
- penambahan JSONKEY pada Model
- getAllTask FROM REST API with many join
# 07/11/2023
- update ui task screen : redesign task screen
# 10/11/2023
- delete localtask setelah diupload
- sorting master asset
- sorting preventive
# 13/11/2023
- add location, long, lat
- add filtering task by range date, and statusTask
# 01/12/2023
- add sub category point checklist berdasarkan isChecklist
# 02/12/2023
- change flow camera permission
- add logout dialog
- show default pointchecklist "NA"
# 12/12/2023
- sorting preventive and reguler task : all status
- disable input form torque and verticality when not todo
# 14/12/2023
- Add Message Dialog jika asset, report regular verticality, theodolite 1 dan 2, report reg Torque, dan gambar not exist
# 13/12/2023
- Keluar Aplikasi ada dialog konfirmasi
- Handling login error
- Sebelum upload asset, maker harus upload e-sign
- Add loading indicator when load asset from server (selain todo)
# 23/12/2023
- Bug Temuan -> tambah gambar Kolom temuan, Kategory temuan jadi naik
# 28/12/2023
- proteksi report ketika status bukan todo
- reset password
- hit rest delete asset saat upload task
# 02/01/2024
- add constant variable
# 08/01/2023
- Add notes & feedback
# 22/01/2024
- resize font camera
# 25/01/2024
- Sorting TEMUAN di idx terakhir saat akan Upload
# 26/01/2024
- add color option for text camera
- bug fixing : site id uniq and replace cause problem
# 20/02/2024
- add keterangan di pointchecklist
- add notif and keterangan ketika tidak ada koneksi internet
- pisahkan folder camera sesuai dengan task id yang dipilih
# 22/02/2024
- Improvement menu AlbumScreen untuk get All Image
- Add fitur DeleteAll Image di menu AlbumScreen
- Add Dialog Confirmation saat deleteAll Image