# $text = "The Population of 298444215 is growing";
$text = "121213123";

$text =~ s/(?<=\d)(?=(\d\d\d)+$)/,/g;

print "$text\n";

