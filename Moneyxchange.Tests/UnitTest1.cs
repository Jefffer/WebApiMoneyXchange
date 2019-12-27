using System;
using BusinessLayer.Services;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Moneyxchange.Tests
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void TestExchangeCurrency()
        {
            // Arrange Test
            ConversionService conversionService = new ConversionService();
            string from = "USD";
            string to = "EUR";
            decimal amount = 10;

            // Act Test
            decimal result = conversionService.GetExchange(from, to, amount);
            decimal expected = (decimal)8.992650;

            // Assert Test
            Assert.AreEqual(result, expected);

        }
    }
}
