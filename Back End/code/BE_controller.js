dataTest = {};
fetch('../data_test/test.json')
    .then(resp => {
        return resp.json();
    })
    .then(data => {
        dataTest=data;
    })

