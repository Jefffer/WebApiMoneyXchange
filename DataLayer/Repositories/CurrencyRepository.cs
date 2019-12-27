using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLayer.Repositories
{
    public class CurrencyRepository : GenericRepository<DBModel>
    {
        GenericRepository<DBModel> _repo = new GenericRepository<DBModel>();

        public List<Currency> GetAll()
        {
            return _repo.GetAll<Currency>();
        }

        public Currency GetById(int id)
        {
            return _repo.GetById<Currency>(id);
        }

        public void Add(Currency item)
        {
            _repo.Add<Currency>(item);
        }

        public void Update(Currency item)
        {
            _repo.Update<Currency>(item);
        }

        public void Delete(Currency item)
        {
            _repo.Delete<Currency>(item);
        }
    }
}
