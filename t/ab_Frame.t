use strict;
use warnings;

use Test::More qw(no_plan); 
# use CGI::AppBuilder::Message qw(:all); 

use CGI::AppBuilder::Frame;
my $class = 'CGI::AppBuilder::Frame';
my $obj = CGI::AppBuilder::Frame->new; 

isa_ok($obj, "CGI::AppBuilder::Frame");

my @md = @CGI::AppBuilder::Frame::EXPORT_OK;
foreach my $m (@md) {
    ok($obj->can($m), "$class->can('$m')");
}

diag("Test frame_set...");
# ($fr, $pr) 
my $fr = [{cols=>"150,*"},[
            {src=>"left.htm",name=>"L"},
           [{rows=>"100,*,50"},[
               {src=>"top.htm",name=>"T"},
               {src=>"main.htm",name=>"C"},
               {src=>"bottom.htm",name=>"B"}]
           ]]
         ];
my $ar = {pretty=>1};
print $obj->frame_set($fr,$ar);
$ar->{_frameset_count} = 0;
my $f2 = [ {cols=>"150,*"},[
             {src=>"left.htm",name=>"L"},
            [{rows=>"100,*,50"},[
               {src=>"top.htm",name=>"T"},
              [{cols=>"*,100"},[
                 {src=>"main.htm",name=>"C"},
                 {src=>"right.htm",name=>"R"}] 
              ], 
               {src=>"bottom.htm",name=>"B"}]
            ]]
     ];
print $obj->frame_set($f2,$ar);

1;

