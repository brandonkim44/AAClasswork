const APIUtil = {
    followUser: id => {
        return $.ajax({
            method: "POST",
            url: `/users/${id}/follow`,
            dataType: 'json'
        });
    },

    unfollowUser: id => {
        return $.ajax({
            method: "DELETE",
            dataType: 'json',
            url: `/users/${id}/follow`
        });
    }
};



module.exports = APIUtil;
