program dequeing;
type
	LongItem2Ptr = ^LongItem2;
	LongItem2 = record
		data: longint;
		prev, next: LongItem2Ptr;
	end;
	
	LongDeque = record
		first, last: LongItem2Ptr;
	end;

procedure LongDequeInit(var deque: LongDeque);
begin
	deque.first := nil;
	deque.last := nil
end;

{add in the beginning}
procedure LongDequePushFront(var deque: LongDeque; n: longint);
var
	newItem: LongItem2Ptr;
begin
	new(newItem);
	newItem^.data := n;
	newItem^.next := deque.first;
	newItem^.prev := nil;
	if deque.first = nil then
		deque.last := newItem
	else 
		deque.first^.prev := newItem;
	deque.first := newItem;
end;

{add in the ending}
procedure LongDequePushBack(var deque: LongDeque; n: longint);
	var newItem: LongItem2Ptr;
begin
	new(newItem);
	newItem^.data := n;
	newItem^.prev := deque.last;
	newItem^.next := nil;
	if deque.last = nil then
		deque.first := newItem
	else
		deque.last^.next := newItem;
	deque.last := newItem;
end;

function LongDequePopFront(var deque: LongDeque; var n: longint): boolean;
var
	poppedItem: LongItem2Ptr;
begin
	if deque.first = nil then begin
		LongDequePopFront := false;
		exit
	end;
	n := deque.first^.data;
	if deque.first^.next = nil then begin
		dispose(deque.first);
		deque.first := nil;
		deque.last := nil
	end
	else begin
		poppedItem := deque.first;
		deque.first^.next^.prev := nil;
		deque.first := deque.first^.next;
		dispose(poppedItem)
	end;
	LongDequePopFront := true;
	
end;

function LongDequePopBack(var deque: LongDeque; var n: longint) : boolean;
var
	poppedItem: LongItem2Ptr;
begin
	if deque.last = nil then begin
		LongDequePopBack := false;
		exit
	end;
	n := deque.last^.data;
	if deque.last^.prev = nil then begin
		dispose(deque.first);
		deque.first := nil;
		deque.last := nil;
	end
	else begin
		poppedItem := deque.last;
		deque.last^.prev^.next := nil;
		deque.last := deque.last^.prev;
		dispose(poppedItem);
	end;
	LongDequePopBack := true;
end;

var 
	deque: LongDeque;
	data: array [1..5] of longint;
	i: integer;
	n: longint;
begin
	LongDequeInit(deque);
	for i:= 1 to 5 do
		data[i] := i;
	writeln('Pushing to end');
	for i := 1 to 5 do 
		LongDequePushBack(deque, data[i]);
	writeln('Poping from start');
	while LongDequePopFront(deque, n) do 
		writeln(n);
	writeln('Pushing to start');
	for i := 1 to 5 do
		LongDequePushFront(deque, data[i]);
	writeln('Poping from back');
	while LongDequePopBack(deque, n) do
		writeln(n);
end.
