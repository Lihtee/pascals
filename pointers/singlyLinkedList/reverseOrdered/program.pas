program DoublePrint;
type
	itemptr = ^item;
	item = record
		data: integer;
		next: itemptr;
	end;
var
	first, last, cur: itemptr;
	curData: integer;
begin
	first := nil;
	last := nil;
	cur := nil;
	while not SeekEof do begin
		read(curData);
		new(cur);
		cur^.data := curData;
		if first = nil then begin
			first := cur;
			last := cur;
		end
		else begin
			last^.next := cur;
			last := cur;
		end
	end;
	
	cur := first;
	while cur <> nil do begin
		writeln(cur^.data);
		writeln(cur^.data);
		cur := cur^.next;
	end
end.
		
	
