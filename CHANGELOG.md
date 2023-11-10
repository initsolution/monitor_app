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