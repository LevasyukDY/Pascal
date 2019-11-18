program num_474j;

const
  n = 100;

type
  mass = array [1..n] of real;

var
  m: mass;
  g: file of real;
  nn: byte;

  {$include '474j_proc.pas'}

begin
  
  write('Введите длину массива (<=100): ');
  readln(nn);
  
  filling_array(nn, m);//заполнение массива
  
  print_array(nn, m);//вывод массива в программу
  
  assign(g, '474j.txt');
  rewrite(g);
  write_array_file(g, nn, m);//вывод массива в файл
  close(g);
  
end.