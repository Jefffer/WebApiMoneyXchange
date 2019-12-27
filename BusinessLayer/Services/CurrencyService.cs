using DataLayer;
using DataLayer.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.Services
{
    public class CurrencyService
    {
        public string GetCurrencyNameById(int id)
        {
            // Go to Repository to get currency name by id
            CurrencyRepository repo = new CurrencyRepository();
            Currency currency = repo.GetById(id);
            return currency.nameCurrency;
        }
    }
}
