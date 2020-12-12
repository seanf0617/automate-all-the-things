const app = require('./server');
const supertest = require("supertest");
const request = supertest(app);

app.get("/url", async (req,res) =>{
res.json({message: "Automate all the things!"});
});

it("Gets the endpoint status", async done =>
{
    const res = await request.get("/url");
    expect(res.status).toBe(200);
    done();
    
})
it("Tests the endpoint message === Automate all the things!", async done =>
{
    const res = await request.get("/url");
    expect(res.body.message).toBe("Automate all the things!");
    done();
    
})
it("Tests the endpoint timestamp === 1529729125", async done =>
{
    const res = await request.get("/url");
    expect(res.body.timestamp).toBe("1529729125");
    done();
    
})
