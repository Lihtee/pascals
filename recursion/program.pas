program recursions;

procedure PrintChars(ch: char; count: integer);
begin
	if count > 0 then begin
		write(ch);
		PrintChars(ch, count - 1)
	end
end;

procedure PrintDigitsOfNumber(n: integer);
begin
	if n > 0 then begin
		PrintDigitsOfNumber(n div 10);
		write(n mod 10, ' ')
	end
end;
begin
	writeln('printing chars');
	PrintChars('4', 100);
	writeln();
	writeln('printing digits of number');
	PrintDigitsOfNumber(228)
end.
