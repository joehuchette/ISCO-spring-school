include("./tower.jl")

function sample_solver(n)
    if n == 5
        const top = [2 3 2 1 2]
        const right = [2 4 3 4 1]
        const bottom = [2 2 3 4 1]
        const left = [3 1 3 2 2]
        solve_tower(n, top, right, bottom, left)
    elseif n == 3
        const top = [2 2 1]
        const right = [1 2 2]
        const bottom = [2 1 3]
        const left = [3 1 2]
        solve_tower(n, top, right, bottom, left)
    end
end
