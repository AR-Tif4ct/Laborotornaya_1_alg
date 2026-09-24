#!/bin/bash

rm -rf claude_monet final_menu

mkdir claude_monet
cd claude_monet
mkdir kitchen
mkdir hall
mkdir bar
mkdir office
mkdir locker_room

cd kitchen
mkdir hot_station
mkdir pastry_station
touch barinov_order

cd hot_station
touch senya_task
touch fedya_task
cd ..

cd pastry_station
touch lui_dessert
touch katya_idea
cd ..
cd ..

cd hall
touch waiter_plan
cd ..

cd bar
touch kostya_report
touch nastya_note
cd ..

cd office 
touch vika_summary
cd ..

cd locker_room
touch max_note
touch leva_note
cd .. 


cd kitchen
cd hot_station

echo "Сеня готовит мясо для банкета
Проверяет температуру горячего цеха
После смены считает оставшиеся продукты" > senya_task

echo "Федя разделывает рыбу для гостей
Готовит фирменную закуску вместе с Сеней
Перед подачей зовёт Баринова" > fedya_task
cd ..

cd pastry_station

echo "Луи выпекает коржи для мильфея
Готовит крем по старому рецепту
Оставляет один десерт для команды" > lui_dessert

echo "Катя предлагает новый шоколадный десерт
Баринов просит уменьшить количество сахара
Пробную порцию получает Макс" > katya_idea

cd ..

echo "Баринов собирает всю команду перед сменой
Каждый повар отвечает за своё рабочее место
Лёва контролирует выдачу блюд" > barinov_order

cd ..
cd hall

echo "Настя обслуживает столики у окна
Официанты встречают гостей в главном зале
Особые просьбы гостей передают Вике" > waiter_plan

cd ..
cd bar

echo "Костя проверил запас напитков
Для вечера подготовлены новые коктейли
Бар откроется одновременно с залом" > kostya_report

echo "Настя просит Костю не опаздывать
После смены они ужинают вместе
Для гостей оставлены чистые бокалы" > nastya_note

cd .. 
cd office

echo "Вика проверила кухню и главный зал
Команда готова к вечерней смене
Отчёт нужно передать Нагиеву" > "vika_summary"

cd ..
cd locker_room

echo "Макс придумал новое блюдо для меню
Баринов разрешил приготовить пробную порцию
Вика ждёт Макса после смены" > max_note

echo "Лёва проверяет форму новых поваров
Ключ от кладовой лежит у шефа
Последним кухню закрывает су-шеф" > leva_note

cd ..

chmod 755 .
chmod u=rwx,g=rx,o= kitchen
chmod 750 kitchen/hot_station
chmod u=rw,g=r,o= kitchen/hot_station/senya_task
chmod 640 kitchen/hot_station/fedya_task
chmod u=rwx,g=rx,o= kitchen/pastry_station
chmod 644 kitchen/pastry_station/lui_dessert
chmod u=rw,g=r,o=r kitchen/pastry_station/katya_idea
chmod 640 kitchen/barinov_order
chmod u=rwx,g=rx,o= hall
chmod 644 hall/waiter_plan
chmod 750 bar
chmod u=rw,g=r,o= bar/kostya_report
chmod 640 bar/nastya_note
chmod u=rwx,g=rx,o= office
chmod 640 office/vika_summary
chmod 750 locker_room
chmod u=rw,g=r,o= locker_room/max_note
chmod 644 locker_room/leva_note

cd ..


cp claude_monet/locker_room/max_note claude_monet/office/max_report
cp -r claude_monet/bar claude_monet/hall/bar_backup
ln -s claude_monet/kitchen/barinov_order final_menu
ln -s ../kitchen claude_monet/office/kitchen_access
ln claude_monet/kitchen/hot_station/senya_task claude_monet/kitchen/hot_station/senya_task_copy

#со строкой ниже помог ИИ, т.к. последовательно скопировать файлы
#и сохранить их в 1 не получалось, один текст заменял другой, а что делать я не понимал(
cat claude_monet/kitchen/hot_station/senya_task claude_monet/kitchen/hot_station/fedya_task > claude_monet/kitchen/cook_tasks
############
cat claude_monet/hall/waiter_plan >> claude_monet/office/vika_summary
mv claude_monet/locker_room/max_note claude_monet/kitchen/max_final_note

#в этом пунте к ИИ было много вопросов с просьбой разъяснить то, да сё. В итоге пошагово собирал "конструктор"
ls -lR | \
grep "^-" | \
sort -k 5 -n -r

grep -r -i -h -E "баринов|макс" claude_monet/ | \
grep -v -i "порц" | \
sort | \
head -n 6

grep -l -r -i -E "кост|наст" claude_monet/bar/ claude_monet/hall/bar_backup/ | \
wc -l


(head -q -n 1 claude_monet/kitchen/hot_station/*_task && tail -q -n 1 claude_monet/kitchen/hot_station/*_task) | \
grep -i -E "сеня|федя|продукт" | \
sort -r


grep -v -E "Сеня|Федя" claude_monet/kitchen/cook_tasks | \
sort -r | \
head -n 4 | \
wc -w


ls -liR | \
grep " -" | \
grep " 2 " | \
sort -k 1 -n


ls -lR | \
grep "^l" | \
grep -v "final" | \
sort -k 9 
########### Также ИИ помог с пониманием "конвеера", но чтобы было самому понятнее, написал всё построчно



rm claude_monet/office/max_report
rm final_menu
rm claude_monet/office/kitchen_access
rm claude_monet/kitchen/hot_station/senya_task_copy
rm claude_monet/locker_room/leva_note
rm -rf claude_monet/locker_room
rm claude_monet/kitchen/max_final_note
rm -r claude_monet/hall/bar_backup