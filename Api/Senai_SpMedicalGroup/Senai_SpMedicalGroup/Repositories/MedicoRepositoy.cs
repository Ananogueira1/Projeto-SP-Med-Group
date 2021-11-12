using Senai_SpMedicalGroup.Contexts;
using Senai_SpMedicalGroup.Domains;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Senai_SpMedicalGroup.Repositories
{
    public class MedicoRepositoy
    {
        MedicalGroupContext ctx = new MedicalGroupContext();

        public void AtualizarUrl(int idMedico, Medico MedicoAtualizado)
        {
            throw new NotImplementedException();
        }

        public Medico BuscarPorId(int idMedico)
        {
            return ctx.Medicos
                .Select(c => new Medico()
                {
                    IdMedico = c.IdMedico,
                    IdUsuario = c.IdUsuario,
                    Crm = c.Crm,
                    NomeMedico = c.NomeMedico,
                    IdClinicaNavigation = new Clinica()
                    {
                        NomeFantasia = c.IdClinicaNavigation.NomeFantasia,
                        Cnpj = c.IdClinicaNavigation.Cnpj,
                        RazaoSocial = c.IdClinicaNavigation.RazaoSocial,
                        Endereco = c.IdClinicaNavigation.Endereco,
                        
                    },
                    IdEspecializacaoNavigation = new Especializacao()
                    {
                        TipoEspecialidade = c.IdEspecializacaoNavigation.TipoEspecialidade
                    },
                    IdUsuarioNavigation = new Usuario()
                    {
                        Nome = c.IdUsuarioNavigation.Nome,
                        Email = c.IdUsuarioNavigation.Email
                    }
                })
                .FirstOrDefault(u => u.IdMedico == idMedico);
        }

        public bool Cadastrar(Medico novoMedico)
        {
            int? idUser = novoMedico.IdUsuario;

            Usuario user = ctx.Usuarios.Find(Convert.ToInt32(idUser));

            if (user.IdTipoUsuario == 3)
            {
                if (user.Medicos.Count == 0)
                {
                    ctx.Medicos.Add(novoMedico);

                    ctx.SaveChanges();
                    return true;
                }
                return false;
            }
            return false;

        }

        public void Deletar(int idMedico)
        {
            Medico medicoBuscado = BuscarPorId(idMedico);

            Usuario userMedico = ctx.Usuarios.Find(medicoBuscado.IdUsuario);

            ctx.Usuarios.Remove(userMedico);

            ctx.Medicos.Remove(medicoBuscado);

            ctx.SaveChanges();
        }

        public List<Medico> ListarTodos()
        {
            return ctx.Medicos
                .Select(c => new Medico()
                {
                    IdMedico = c.IdMedico,
                    IdUsuario = c.IdUsuario,
                    Crm = c.Crm,
                    NomeMedico = c.NomeMedico,
                    IdClinicaNavigation = new Clinica()
                    {
                        NomeFantasia = c.IdClinicaNavigation.NomeFantasia,
                        Cnpj = c.IdClinicaNavigation.Cnpj,
                        RazaoSocial = c.IdClinicaNavigation.RazaoSocial,
                        Endereco = c.IdClinicaNavigation.Endereco,
                    },
                    IdEspecializacaoNavigation = new Especializacao()
                    {
                        TipoEspecialidade = c.IdEspecializacaoNavigation.TipoEspecialidade
                    },
                    IdUsuarioNavigation = new Usuario()
                    {
                        Nome = c.IdUsuarioNavigation.Nome,
                        Email = c.IdUsuarioNavigation.Email
                    }
                })
                .ToList();
        }

        public List<Medico> ListarComUsuario()
        {
            return ctx.Medicos

                .ToList();
        }
    }
}
