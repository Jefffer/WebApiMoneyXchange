using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using BusinessLayer.Services;
using DataLayer;
using WebApiMoneyxchange.Enums;

namespace WebApiMoneyxchange.Controllers
{
    public class ConversionsController : ApiController
    {
        private DBModel db = new DBModel();
        private ConversionService _conversionService = new ConversionService();
        private CurrencyService _currencyService = new CurrencyService();

        // GET: api/Conversions
        public IQueryable<Conversion> GetConversion()
        {
            return db.Conversion;
        }

        // GET: api/Conversions/5
        [ResponseType(typeof(Conversion))]
        public IHttpActionResult GetConversion(int id)
        {
            Conversion conversion = db.Conversion.Find(id);
            if (conversion == null)
            {
                return NotFound();
            }

            return Ok(conversion);
        }

        // PUT: api/Conversions/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutConversion(int id, Conversion conversion)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != conversion.idConversion)
            {
                return BadRequest();
            }

            db.Entry(conversion).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ConversionExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/Conversions
        [ResponseType(typeof(Conversion))]
        public Conversion PostConversion(Conversion conversion)
        {
            try
            {
                // Search in Database by conversion.fromConversion and conversion.toConversion ID to get Currency Name
                string nameFromCurrency = _currencyService.GetCurrencyNameById((int)CurrencyEnum.Dollar);
                string nameToCurrency = _currencyService.GetCurrencyNameById((int)CurrencyEnum.Euro);

                //string nameFromCurrency = "USD";
                //string nameToCurrency = "EUR";

                decimal exchangeRate = _conversionService.GetExchange(nameFromCurrency, nameToCurrency, conversion.fromValue);

                Conversion newConversion = new Conversion
                {
                    fromConversion = (int)CurrencyEnum.Dollar,
                    toConversion = (int)CurrencyEnum.Euro,
                    conversionDate = DateTime.Now,
                    conversionUser = 1, // Admin user
                    fromValue = conversion.fromValue,
                    toValue = exchangeRate
                };

                db.Conversion.Add(newConversion);
                db.SaveChanges();

                //return CreatedAtRoute("DefaultApi", new { id = conversion.idConversion }, conversion);
                return newConversion;
            }
            catch
            {
                return null;
            }
            
        }

        // DELETE: api/Conversions/5
        [ResponseType(typeof(Conversion))]
        public IHttpActionResult DeleteConversion(int id)
        {
            Conversion conversion = db.Conversion.Find(id);
            if (conversion == null)
            {
                return NotFound();
            }

            db.Conversion.Remove(conversion);
            db.SaveChanges();

            return Ok(conversion);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool ConversionExists(int id)
        {
            return db.Conversion.Count(e => e.idConversion == id) > 0;
        }
    }
}