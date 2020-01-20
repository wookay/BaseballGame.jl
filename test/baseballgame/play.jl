module test_baseballgame_play

using Test
using BaseballGame: count_balls

N = 3
@test count_balls([1, 2, 3], [1, 2, 3], N) == (strikes=3, balls=0)
@test count_balls([1, 2, 3], [2, 3, 1], N) == (strikes=0, balls=3)
@test count_balls([1, 2, 3], [1, 3, 5], N) == (strikes=1, balls=1)
@test count_balls([1, 2, 3], [1, 3, 2], N) == (strikes=1, balls=2)
@test count_balls([1, 2, 3], [1, 2, 5], N) == (strikes=2, balls=0)

N = 4
@test count_balls([1, 2, 3, 4], [1, 2, 3, 4], N) == (strikes=4, balls=0)
@test count_balls([1, 2, 3, 4], [2, 3, 1, 5], N) == (strikes=0, balls=3)
@test count_balls([1, 2, 3, 4], [1, 3, 5, 6], N) == (strikes=1, balls=1)
@test count_balls([1, 2, 3, 4], [1, 3, 2, 7], N) == (strikes=1, balls=2)
@test count_balls([1, 2, 3, 4], [1, 2, 5, 7], N) == (strikes=2, balls=0)

end # module test_baseballgame_play
