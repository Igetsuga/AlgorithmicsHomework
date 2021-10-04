
```
ДАНО: Робот находится в произвольной клетке ограниченного прямоугольного поля без внутренних перегородок и маркеров.
РЕЗУЛЬТАТ: Робот — в исходном положении в центре прямого креста из маркеров, расставленных вплоть до внешней рамки.

Рассмотреть отдельно еще случай, когда изначально в некоторых клетках поля могут находиться маркеры.
```

```
Если на поле будут стоять маркеры, то они не повлияют на ход программы. Иначе можно было бы добавить проверку
на наличие маркера в клетке, стоящей на пути Робота.
```

# get_line! создаёт линию из маркеров в заданном направлении и возвращает Робота в исходное положение
function get_line!(side)::Nothing
    steps = 0
    while ((isborder(r,side))==false)
        move!(r,side)
        putmarker!(r)
        steps += 1
    end
    for j in 1:steps 
        move!(r,HorizonSide((Int(side)+2)%4))
    end
end

# Point1_master! главная функция программы
function Point1_master!(r::Robot)::Nothing
    for side in [Nord, Ost, Sud, West]
        get_line!(side)
    end
    putmarker!(r)
end