export const postUser = user => {
    return (
        $.ajax({
            method: 'POST',
            url: '/api/users',
            data: { user} //slice of data nested underneath key of user
        })
    )
};

export const postSession = user => {
    return (
        $.ajax({
            method: 'POST',
            url: '/api/session',
            data: { user } //slice of data nested underneath key of user
        })
    )
};

export const deleteSession = () => {
    return (
        $.ajax({
            method: 'DELETE',
            url: '/api/session' // no slice of data to send that up with
        })
    )
};