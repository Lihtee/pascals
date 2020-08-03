program pointerPointer;
type
	itemptr = ^item;
        item = record
                data: integer;
                next: itemptr;
        end;
	pp = ^itemptr;
var 
