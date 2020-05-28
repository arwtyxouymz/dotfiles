    let (a, b) = {
        let ab = get_line().split_whitespace()
            .map(|e| e.parse().unwrap())
            .collect::<Vec<{{_cursor_}}>>();
        (ab[0], ab[1])
    };
