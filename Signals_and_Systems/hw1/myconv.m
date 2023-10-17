    x1 = transpose([1:20, 19:-1:1])
    nexttile
    stem(x1)
    x2 = transpose(ones(1, 10))
    nexttile
    stem(x2)
    y1 = conv(x1, x2)
    nexttile
    stem(y1)
    matrix = []
    for i = 1:48
        for j = 1:10
            if i >= j & i - j < 39
                matrix(i,j) = x1(i - j + 1)
            else
                matrix(i,j) = 0
            end
        end
    end
    y2 = matrix * x2
    nexttile
    stem(y2)

    x1 = [3; 9; 27]
    nexttile
    stem(x1)
    x2 = [2; 4; 8; 16; 32]
    nexttile
    stem(x2)
    y1 = conv(x1, x2)
    nexttile
    stem(y1)
    matrix = []
    for i = 1:7
        for j = 1:5
            if i >= j & i - j < 3
                matrix(i,j) = x1(i - j + 1)
            else
                matrix(i,j) = 0
            end
        end
    end
    y2 = matrix * x2
    nexttile
    stem(y2)