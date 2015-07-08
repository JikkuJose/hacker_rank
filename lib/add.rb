puts DATA.read.split.drop(1).map(&:to_i).reduce(:+)

__END__
5
1000000001 1000000002 1000000003 1000000004 1000000005
