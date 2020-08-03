program mult;
function ReadLongInt(var result: longint) : boolean;
var 
	c: char;
	res: longint;
	pos: integer;
begin
	res := 0;
	pos := 0;
	repeat
		read(c);
		pos := pos + 1
	until (c <> ' ') and (c <> #10);
	while (c <> ' ') and (c <> #10) do begin
		if (c < '0') or (c > '9') then begin
			writeln('Unexpected ', c, ' in pos: ', pos);
			readln;
			ReadLongint := false;
			exit
		end;
		res := res * 10 + ord(c) - ord('0');
		read(c);
		pos := pos + 1
	end;
	result := res;
	ReadLongInt := true
end;

var 
	x, y: longint;
begin
	while not ReadLongInt(x) do ;
	while not ReadLongInt(y) do ;
	writeln(x, ' times ', y, ' is ', x * y)
end.
