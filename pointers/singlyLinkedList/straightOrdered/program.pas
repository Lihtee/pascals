program ReverseNumbers;
type
	itemptr = ^item;
	item = record
		data: integer;
		next: itemptr;
	end;
var 
	lastItem: itemptr;
	curData: integer;
	curItem: itemptr;
begin
	lastItem := nil;
	while not SeekEof do begin
		read(curData);
		new(curItem);
		curItem^.data := curData;
		curItem^.next := lastItem;
		lastItem := curItem;
	end;

	while lastItem <> nil do begin
		write(lastItem^.data, ' ');
		lastItem := lastItem^.next;
	end;

	writeln;
end.
	
