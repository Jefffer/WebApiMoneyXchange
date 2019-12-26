﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using DataLayer;

namespace WebApiMoneyxchange.Controllers
{
    public class ConversionsController : ApiController
    {
        private DBModel db = new DBModel();

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
        public IHttpActionResult PostConversion(Conversion conversion)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Conversion.Add(conversion);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = conversion.idConversion }, conversion);
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