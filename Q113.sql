set @row := 0;
select repeat('* ', @row := @row + 1)as pattern from information_schema.tables where @row < 20;