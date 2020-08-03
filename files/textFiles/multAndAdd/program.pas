program MultAndAdd;
var 
	sum, mult, n: real;
	f: text;
begin
	{$I-}
	if ParamCount < 1 then begin
		writeln('Please specify the file name');
		halt
	end;
	assign(f, ParamStr(1));
	reset(f);
	if IOResult <> 0 then begin
		writeln('Could not open ', ParamStr(1));
		halt
	end;
	sum := 0;
	while not SeekEof(f) do begin
		mult := 1;
		while not SeekEoln(f) do begin
			read(f, n);
			mult := mult *  n
		end;
		readln(f);
		sum := sum + mult
	end;
	writeln(sum:7:5)
end.
