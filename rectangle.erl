-module(rectangle).
-include("rectangle.hrl").
-export([new/2, min_square/1, max_square/1, total_square/1]).

new(Width, Height) ->
  #rectangle{width=Width, height=Height}.

min_square(List) ->
  min_square(List, #rectangle{width=9000, height=9000}).

max_square(List) ->
  max_square(List, #rectangle{width=0, height=0}).

total_square(List) ->
  total_square(List, 0).

min_square([Rectangle | List], MinRectangle) ->
  min_square(List, min_rectangle(MinRectangle, Rectangle));
min_square([], MinRectangle) ->
  MinRectangle.

max_square([Rectangle | List], MaxRectangle) ->
  max_square(List, max_rectangle(MaxRectangle, Rectangle));
max_square([], MaxRectangle) ->
  MaxRectangle.

max_rectangle(Rect1, Rect2) ->
  Square1 = square(Rect1),
  Square2 = square(Rect2),
  if Square1 >= Square2 -> Rect1;
     true -> Rect2
  end.

min_rectangle(Rect1, Rect2) ->
  Square1 = square(Rect1),
  Square2 = square(Rect2),
  if Square1 < Square2 -> Rect1;
     true -> Rect2
  end.

total_square([Rectangle | List], Sum) ->
  total_square(List, Sum + square(Rectangle));
total_square([], Sum) ->
  Sum.

square({rectangle, Width, Height}) ->
  Width * Height.
