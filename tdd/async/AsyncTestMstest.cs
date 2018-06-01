[TestClass]
public class AsyncTestMstest
{
   

    // Warning: bad code!
    [TestMethod]
    public void IncorrectlyPassingTest()
    {
        Task<int> task = SystemUnderTest.SimpleAsync();
        Assert.AreEqual(1, task.Result);
    }

    [TestMethod]
    public async void IncorrectlyPassingTest2()
    {
        int task = await SystemUnderTest.SimpleAsync();
        Assert.AreEqual(1, task);
    }

    [TestMethod]
    public async Task IncorrectlyPassingTest3()
    {
        int task = await SystemUnderTest.SimpleAsync();
        Assert.AreEqual(1, task);
    }

    [TestMethod]
    public void IncorrectlyPassingTest4()
    {
        Task.Run(async () =>
                 {
                     var task = SystemUnderTest.SimpleAsync();
                     Assert.AreEqual(1, task);
                 }).GetAwaiter().GetResult();
    }

    [TestMethod]
    public async Task RetrieveValue_SynchronousSuccess_Adds42()
    {
        var service = new Mock<IMyService>();
        service.Setup(x => x.GetAsync()).Returns(() => Task.FromResult(5));
        // Or: service.Setup(x => x.GetAsync()).ReturnsAsync(5);
        var system = new SystemUnderTest2(service.Object);
        var result = await system.RetrieveValueAsync();
        Assert.AreEqual(47, result);
    }

    [TestMethod]
    public async Task RetrieveValue_AsynchronousSuccess_Adds42()
    {
        var service = new Mock<IMyService>();
        service.Setup(x => x.GetAsync()).Returns(async () =>
        {
            await Task.Yield();
            return 5;
        });
        var system = new SystemUnderTest2(service.Object);
        var result = await system.RetrieveValueAsync();
        Assert.AreEqual(47, result);
    }

    [TestMethod]
    public async Task RetrieveValue_AsynchronousFailure_Throws()
    {
        var service = new Mock<IMyService>();
        service.Setup(x => x.GetAsync()).Returns(async () =>
        {
            await Task.Yield();
            throw new Exception();
        });
        var system = new SystemUnderTest2(service.Object);
        await AssertEx.ThrowsAsync<Exception>(system.RetrieveValueAsync);
    }
}

public static class AssertEx
{
    public static async Task<TException> ThrowsAsync<TException>(Func<Task> action, bool allowDerivedTypes = true) where TException : Exception
    {
        try
        {
            await action();
        }
        catch (Exception ex)
        {
            if (allowDerivedTypes && !(ex is TException))
                throw new Exception("Delegate threw exception of type " + ex.GetType().Name + ", but " + typeof(TException).Name + " or a derived type was expected.", ex);
            if (!allowDerivedTypes && ex.GetType() != typeof(TException))
                throw new Exception("Delegate threw exception of type " + ex.GetType().Name + ", but " + typeof(TException).Name + " was expected.", ex);
            return (TException)ex;
        }
        throw new Exception("Delegate did not throw expected exception " + typeof(TException).Name + ".");
    }

    public static Task<Exception> ThrowsAsync(Func<Task> action)
    {
        return ThrowsAsync<Exception>(action, true);
    }
}
