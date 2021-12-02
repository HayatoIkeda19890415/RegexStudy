while ($line = <>) {
    if ($line =~ m/^\s*$/) {
        last;
    }
    if ($line =~ m/^subject: (.*)/i) {
        $subject = $1;
    }
    if ($line =~ m/^date: (.*)/i) {
        $date = $1;
    }
    if ($line =~ m/^reply-to: (.*)/i) {
        $reply_address = $1;
    }
    if ($line =~ m/^From: (\S+) \(([^()]*)\)/i) {
        $reply_address = $1;
        $from_name = $2;
    }
}

if (not defined($subject)) {
    die "coudn't glean required infomation : subject";
}
if (not defined($date)) {
    die "coudn't glean required infomation : date";
}
if (not defined($reply_address)) {
    die "coudn't glean required infomation : reply_address";
}
if (not defined($from_name)) {
    die "coudn't glean required infomation : from_name";
}

print "To: $reply_address ($from_name)\n";
print "From: jfriedl\@regex.info (Jejjrey Friedl)\n";
print "Subject: Re: $subject\n";
print "\n";
print "On $date $from_name wrote:\n";
while ($line = <>) {
    print "|> $line";
}
