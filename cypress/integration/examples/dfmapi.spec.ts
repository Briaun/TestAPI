/// <reference types="cypress" />

describe('Test API', function() {
    it('Post', function() {
       cy.request({
          method : 'POST',
          url : 'https://www.dtcdfm.com:8083/getHelloMsg',
          body: {
            "ssid" : "12345"
          },
          headers: {
             'content-type' : 'application/json'
          }
       }).then(function (response){
          
            expect(response.body).to.deep.equal({
               "error": false,
               "code": "200",
               "message": "ok",
               "msg_count": 1,
               "msg_data": [
    {
               "title": "ยินดีต้อนรับ",
               "body": "ขอให้ขับรถด้วยความปลอยภัย และรักษากฎจราจรอย่างเคร่งครัด"
    }
  ]
                  
              
            })
       })
    })
 })