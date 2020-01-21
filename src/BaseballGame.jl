module BaseballGame

export play

using Random

function isloop(input)
    input != "q"
end

function count_balls(nums, guess, N)
    strikes = count(i-> guess[i] == nums[i], 1:N)
    balls = count(i-> guess[i] in getindex.(Ref(nums), setdiff(Set(1:N), i)), 1:N)
    (strikes=strikes, balls=balls)
end

function print_input_numbers(N)
    print("please input $N numbers: ")
end

function play(; N=3, nums::Vector{Int}=shuffle(1:9)[1:N], debug=false)
    println("input q to quit")
    debug && @info nums
    while (print_input_numbers(N); input = readline(); isloop(input))
        if length(input) == 3
            delim = ""
        elseif length(input) == 5
            delim = ' '
        else
            @info :wrong_size
            continue
        end
        guess = nothing
        try
            guess = parse.(Int, split(input, delim))
        catch err
            @info :wrong_input
            continue
        end
        if !allunique(guess)
            @info :not_unique_numbers
        elseif !all(x -> x in 1:9, guess)
            @info :not_1_to_9
        else
            result = count_balls(nums, guess, N)
            if result.strikes == N
                printstyled("$N strikes!\n", color=:green)
                break
            else
                @info result
            end
        end
    end
end

end # module BaseballGame
