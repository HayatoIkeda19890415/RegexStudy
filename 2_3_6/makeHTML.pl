undef $/; # "$/"を未定義にして改行を含めて1行で読み込む
$text = <>;

# 特殊文字の変換
$text =~ s/&/&amp;/g; # 置換先が"&"を含むので最初に"&"を変換しなければならない
$text =~ s/</&lt;/g;
$text =~ s/>/&gt;/g;

# 改行だけの行をpタグに変換
# $text =~ s/^$/<p>/mg
$text =~ s/^\s*$/<p>/m; # /m:文字列を複数行として扱う修飾子

$hostnameRegex = qr/[-a-z0-9]+(\.[-a-z0-9]+)*\.(com|edu|info)/;

# メールアドレスを変換
$text =~ s/
    \b(
        \w[-.\w]*
        \@
        $hostnameRegex
    )\b
    /<a href="mailto:$1">$1<\/a>/gix; # /xをつけても置換先は改行やスペースが有効になるので注意。

# URLをリンクに変換
$text =~ s/
    \b(
        https?:\/\/$hostnameRegex\b
        (
            \/[-a-z0-9_:\@&?=+,.!\/~*'^\$]*
            (?![.,?!]) # 末尾が[.,?!]であってはならない
        )?
    )
    /<a href="$1">$1<\/a>/gix;

print $text;

