1. Установите MySQL.
2. Создайте пустую базу данных:
   	CREATE DATABASE MFCvacations;
3. Импортируйте дамп:
      mysql -u username -p MFCvacations < MFCvacations_dump.sql
Здесь username — имя пользователя MySQL, после нажатия Enter попросит пароль.
4. Проверьте и при необходимости измените настройки в .env (логин, пароль, host, port, имя базы)
5. Запустите main.exe

