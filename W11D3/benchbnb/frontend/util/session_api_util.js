export const signup = (userParams) => {
    return (
        $.ajax({
            method: 'POST',
            url: '/api/users',
            data: { user: userParams}
        })
    )
};

export const login = (userParams) => {
    return (
        $.ajax({
            method: 'POST',
            url: '/api/session',
            data: { user: userParams }
        })
    )
};

export const logout = () => {
    return (
        $.ajax({
            method: 'DELETE',
            url: '/api/session'
        })
    )
};