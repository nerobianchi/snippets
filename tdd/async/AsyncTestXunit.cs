public class AsyncTestXunit
{
    [Fact]
    public async Task IncorrectlyPassingTest3()
    {
        //int task = await SystemUnderTest.SimpleAsync();
        await Xunit.Assert.ThrowsAsync<Exception>(() => SystemUnderTest.SimpleAsync());
        //await Xunit.Assert.ThrowsAsync<Exception>(() => SystemUnderTest.SimpleAsync());
    }

    [Fact]
    public async Task RetrieveValue_SynchronousSuccess_Adds42()
    {
        var service = new Mock<IMyService>();
        service.Setup(x => x.GetAsync()).Returns(() => Task.FromResult(5));
        // Or: service.Setup(x => x.GetAsync()).ReturnsAsync(5);
        var system = new SystemUnderTest2(service.Object);
        var result = await system.RetrieveValueAsync();
        Xunit.Assert.Equal(47, result);
    }

    [Fact]
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
        Xunit.Assert.Equal(47, result);
    }

    [Fact]
    public async Task RetrieveValue_AsynchronousFailure_Throws()
    {
        var service = new Mock<IMyService>();
        service.Setup(x => x.GetAsync()).Returns(async () =>
        {
            await Task.Yield();
            throw new Exception();
        });
        var system = new SystemUnderTest2(service.Object);
        await Xunit.Assert.ThrowsAsync<Exception>(system.RetrieveValueAsync);
    }
}
public sealed class SystemUnderTest
{
    public static async Task<int> SimpleAsync()
    {
        await Task.Delay(2000);
        throw new Exception("Should fail.");
        return 1;
    }
}
public interface IMyService
{
    Task<int> GetAsync();
}

public sealed class SystemUnderTest2
{
    private readonly IMyService _service;

    public SystemUnderTest2(IMyService service)
    {
        _service = service;
    }

    public async Task<int> RetrieveValueAsync()
    {
        return 42 + await _service.GetAsync();
    }
}
