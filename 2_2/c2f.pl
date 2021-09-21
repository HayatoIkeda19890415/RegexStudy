print "Enter a temperature in Celsius:\n";
$celsius = <STDIN>;
chomp($celsius); # $celsiusの末尾の改行文字を取り除く

if ( $celsius =~ m/^[-+]?[0-9]+(\.[0-9]*)?$/ ) {
    $fahrenheit = ($celsius * 9 / 5) + 32;
    printf "%.2f C is %.2f F \n", $celsius, $fahrenheit;
} else {
    print "Expecting a number, so I don't understand \"$celsius\".\n";
}
