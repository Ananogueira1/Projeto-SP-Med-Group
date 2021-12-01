using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Senai_SpMedicalGroup.Domains;
using Senai_SpMedicalGroup.Interfaces;
using Senai_SpMedicalGroup.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Senai_SpMedicalGroup.Controllers
{
    [Produces("application/json")]
    [Route("api/[controller]")]
    [ApiController]
    public class MedicosController : ControllerBase
    {
        private MedicoRepositoy _MedicoRepositoy { get; set; }

        public MedicosController()
        {
            _MedicoRepositoy = new MedicoRepositoy();
        }

        /// <summary>
        /// Lista todos os médicos
        /// </summary>
        /// <returns></returns>
        [Authorize(Roles = "1")]
        [HttpGet]
        public IActionResult Get()
        {
            try
            {
                return Ok(_MedicoRepositoy.ListarTodos());
            }
            catch (Exception erro)
            {
                return BadRequest(erro);
            }
        }

        /// <summary>
        /// Lista um médico através do id
        /// </summary>
        /// <returns></returns>
        [Authorize(Roles = "2")]
        [HttpGet("{id}")]
        public IActionResult GetById(int id)
        {
            try
            {
                return Ok(_MedicoRepositoy.BuscarPorId(id));
            }
            catch (Exception erro)
            {
                return BadRequest(erro);
            }
        }


        /// <summary>
        /// Cadastra um novo médico
        /// </summary>
        /// <param name="novoMedico">Dados do médico a ser cadastrado</param>
        /// <returns></returns>
        [Authorize(Roles = "2")]
        [HttpPost]
        public IActionResult Post(Medico novoMedico)
        {
            try
            {
                bool created = _MedicoRepositoy.Cadastrar(novoMedico);

                if (created) return StatusCode(201);

                return NotFound(
                        new
                        {
                            mensagem = "Usuario precisa ser do tipo médico e não estar vinculado a outro médico",
                            erro = true
                        }
                    );
            }
            catch (Exception erro)
            {
                return BadRequest(erro);
            }
        }

    }

}

