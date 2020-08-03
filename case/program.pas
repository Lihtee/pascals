program SymbolType;
var 
	c: char;
begin
	read(c);
	write('The symbol is ');
	case c of
		'a'..'z', 'A'..'Z':
			writeln('a latin letter');
		'0'..'9':
			writeln('a digit');
		'+', '-', '/', '*':
			writeln('an arithmetic operation symbol');
		'<', '>', '=':
			writeln('a comparision sign');
		else 
			writeln('other symbol')
	end
end.
