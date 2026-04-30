# Скрипты слайсера для Neptune 4 Pro

Скопируйте эти скрипты в настройки принтера в вашем слайсере (OrcaSlicer).

---

## Start G-code (Стартовый скрипт)

```gcode
M220 S100 ; Сброс скорости
M221 S100 ; Сброс потока
M104 S0   ; Отключаем автонагрев сопла слайсером
M140 S0   ; Отключаем автонагрев стола слайсером

PRINT_START EXTRUDER_TEMP=[nozzle_temperature_initial_layer] BED_TEMP=[bed_temperature_initial_layer_single] AREA_START={first_layer_print_min[0]},{first_layer_print_min[1]} AREA_END={first_layer_print_max[0]},{first_layer_print_max[1]}
```

---

## End G-code (Конечный скрипт)

```gcode
PRINT_END
```

---

## Что делает PRINT_START (последовательность):
1. Включает свет
2. Запускает преднагрев сопла до 150°C и нагрев стола
3. Выполняет безопасный хоуминг (CG28) и перемещает Eddy в центр
4. Ждёт нагрева стола (M190)
5. Ждёт 60 секунд для термостабилизации датчика Eddy
6. Ждёт 150°C на сопле (M109 S150)
7. Выполняет точный Z-Homing + адаптивную сетку KAMP
8. Паркуется рядом с деталью (Smart_Park)
9. Нагревает сопло до рабочей температуры (M109)
10. Печатает очищающую линию (LINE_PURGE)
