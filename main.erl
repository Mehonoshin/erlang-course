-module(main).
-include("rectangle.hrl").
-export([run/0]).

run() ->
  Total = rectangle:total_square(list()),
  Max = rectangle:max_square(list()),
  Min = rectangle:min_square(list()),
  io:format("Results: ~n", [Total, Max, Min]).

list() ->
  [
    rectangle:new(1,5),
    rectangle:new(20,3),
    rectangle:new(7, 10),
    rectangle:new(11, 4)
  ].
