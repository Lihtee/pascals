program diamond;

procedure Print(symbol: string);
begin
	write(symbol)
end;

procedure Println(symbol: string);
begin
	writeln(symbol);
end;

var
	x, y, size, half: integer;
begin
	read(size);
	half := size div 2;
	for x:=0 to size-1 do begin
		for y:=0 downto -size+1 do begin
			
			if (y - x + half = 0)
			or (y + x + half = 0)
			or (y - x + half + size -1 = 0)
			or (y + x - half = 0)
			then Print('*')
			else Print(' ')			
		end;
		Println('')
	end
end.
