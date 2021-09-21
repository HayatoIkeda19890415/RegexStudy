print "Enter a temperature (e.g., 32F, 100C):\n";
$input = <STDIN>;
chomp($input); # $inputの末尾の改行文字を取り除く

# "(?:"はキャプチャされないグループ
if ($input =~ m/^([-+]?[0-9]+(?:\.[0-9]*)?)\s*([CF])$/i) {
    print "\$1 = \"$1\"\n";
    print "\$2 = \"$2\"\n";
    $InputNum = $1;
    $type = $2;

    if ($type =~ m/c/i) {
        $celsius = $InputNum;
        $fahrenheit = ($celsius * 9 / 5) + 32;
    } else {
        $fahrenheit = $InputNum;
        $celsius = ($fahrenheit - 32) * 5 / 9;
    }
    printf "%.2f C is %.2f F \n", $celsius, $fahrenheit;
} else {
    print "Expecting a number followed by \"C\" or \"F\".\n";
    print "So I don't understand \"$input\".\n";
}
