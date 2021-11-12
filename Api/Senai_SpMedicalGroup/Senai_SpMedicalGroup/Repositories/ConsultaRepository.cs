using Senai_SpMedicalGroup.Contexts;
using Senai_SpMedicalGroup.Domains;
using Senai_SpMedicalGroup.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Senai_SpMedicalGroup.Repositories
{
    public class ConsultaRepository: IConsultaRepository
    {
        MedicalGroupContext ctx = new MedicalGroupContext();
        public bool AtualizarDescricao(int idConsulta, int idUserMedico, Consultum consulta)
        {
            Consultum consultaBuscada = ctx.Consulta.FirstOrDefault(p => p.IdConsulta == idConsulta);

            Medico medico = ctx.Medicos.FirstOrDefault(m => m.IdUsuario == idUserMedico);

            if (consultaBuscada == null) return false;
            if (medico.IdMedico != consultaBuscada.IdMedico) return false;

            consultaBuscada.Descricao = consulta.Descricao;
            ctx.Consulta.Update(consultaBuscada);

            ctx.SaveChanges();

            return true;
        }

        public bool AlterarSituacao(int idConsulta, string status)
        {
            Consultum consultaBuscada = ctx.Consulta.FirstOrDefault(p => p.IdConsulta == idConsulta);

            if (consultaBuscada == null) return false;

            switch (status)
            {
                case "1":
                    consultaBuscada.IdSituacao = 1;
                    break;
                case "2":
                    consultaBuscada.IdSituacao = 2;
                    break;
                case "3":
                    consultaBuscada.IdSituacao = 3;
                    break;
                default:
                    consultaBuscada.IdSituacao = consultaBuscada.IdSituacao;
                    break;
            }

            ctx.Consulta.Update(consultaBuscada);

            ctx.SaveChanges();

            return true;
        }

        public void AtualizarUrl(int idConsulta, Consultum consultaAtualizada)
        {
            throw new NotImplementedException();
        }

        public Consultum BuscarPorId(int idConsulta)
        {
            return ctx.Consulta.FirstOrDefault(u => u.IdConsulta == idConsulta);
        }

        public void Cadastrar(Consultum novaConsulta)
        {
            ctx.Consulta.Add(novaConsulta);

            ctx.SaveChanges();
        }

        public bool Cancelar(int idConsulta)
        {
            Consultum consultaBuscada = ctx.Consulta.FirstOrDefault(p => p.IdConsulta == idConsulta);

            if (consultaBuscada != null)
            {
                if (consultaBuscada.IdSituacao == 1) return false;

                consultaBuscada.IdSituacao = 2;

                ctx.Consulta.Update(consultaBuscada);

                ctx.SaveChanges();

                return true;
            }
            return false;
        }

        public void Deletar(int idConsulta)
        {
            ctx.Consulta.Remove(BuscarPorId(idConsulta));
        }

        public List<Consultum> ListarTodos()
        {
            return ctx.Consulta
                .Select(c => new Consultum()
                {
                    IdConsulta = c.IdConsulta,
                    DataConsulta = c.DataConsulta,
                    Descricao = c.Descricao,
                    IdMedicoNavigation = new Medico()
                    {
                        IdMedico = c.IdMedicoNavigation.IdMedico,
                        IdUsuario = c.IdMedicoNavigation.IdUsuario,
                        Crm = c.IdMedicoNavigation.Crm,
                        NomeMedico = c.IdMedicoNavigation.NomeMedico,
                        IdClinicaNavigation = new Clinica()
                        {
                            NomeFantasia = c.IdMedicoNavigation.IdClinicaNavigation.NomeFantasia,
                            Cnpj = c.IdMedicoNavigation.IdClinicaNavigation.Cnpj,
                            RazaoSocial = c.IdMedicoNavigation.IdClinicaNavigation.RazaoSocial,
                            Endereco = c.IdMedicoNavigation.IdClinicaNavigation.Endereco
                        },
                        IdEspecializacaoNavigation = new Especializacao()
                        {
                            TipoEspecialidade = c.IdMedicoNavigation.IdEspecializacaoNavigation.TipoEspecialidade
                        },
                        IdUsuarioNavigation = new Usuario()
                        {
                            Nome = c.IdMedicoNavigation.IdUsuarioNavigation.Nome,
                            Email = c.IdMedicoNavigation.IdUsuarioNavigation.Email
                        }
                    },
                    IdPacienteNavigation = new Paciente()
                    {
                        IdPaciente = c.IdPacienteNavigation.IdPaciente,
                        DataNascimento = c.IdPacienteNavigation.DataNascimento,
                        NomePaciente = c.IdPacienteNavigation.NomePaciente,
                        Telefone = c.IdPacienteNavigation.Telefone,
                        Rg = c.IdPacienteNavigation.Rg,
                        Cpf = c.IdPacienteNavigation.Cpf,
                        Endereco = c.IdPacienteNavigation.Endereco,
                        IdUsuarioNavigation = new Usuario()
                        {
                            Nome = c.IdMedicoNavigation.IdUsuarioNavigation.Nome,
                            Email = c.IdMedicoNavigation.IdUsuarioNavigation.Email
                        }
                    },
                    IdSituacaoNavigation = new Situacao()
                    {
                        IdSituacao = c.IdSituacaoNavigation.IdSituacao,
                        Situacao1 = c.IdSituacaoNavigation.Situacao1
                    }
                })
                .ToList();
        }

        public List<Consultum> VerMinhas(int idUsuario)
        {
            return ctx.Consulta
                .Select(c => new Consultum()
                {
                    IdConsulta = c.IdConsulta,
                    DataConsulta = c.DataConsulta,
                    Descricao = c.Descricao,
                    IdMedicoNavigation = new Medico()
                    {
                        IdMedico = c.IdMedicoNavigation.IdMedico,
                        IdUsuario = c.IdMedicoNavigation.IdUsuario,
                        Crm = c.IdMedicoNavigation.Crm,
                        NomeMedico = c.IdMedicoNavigation.NomeMedico,
                        IdClinicaNavigation = new Clinica()
                        {
                            NomeFantasia = c.IdMedicoNavigation.IdClinicaNavigation.NomeFantasia,
                            Cnpj = c.IdMedicoNavigation.IdClinicaNavigation.Cnpj,
                            RazaoSocial = c.IdMedicoNavigation.IdClinicaNavigation.RazaoSocial,
                            Endereco = c.IdMedicoNavigation.IdClinicaNavigation.Endereco
                        },
                        IdEspecializacaoNavigation = new Especializacao()
                        {
                            TipoEspecialidade = c.IdMedicoNavigation.IdEspecializacaoNavigation.TipoEspecialidade
                        },
                        IdUsuarioNavigation = new Usuario()
                        {
                            Nome = c.IdMedicoNavigation.IdUsuarioNavigation.Nome,
                            Email = c.IdMedicoNavigation.IdUsuarioNavigation.Email
                        }
                    },
                    IdPacienteNavigation = new Paciente()
                    {
                        IdPaciente = c.IdPacienteNavigation.IdPaciente,
                        IdUsuario = c.IdPacienteNavigation.IdUsuario,
                        DataNascimento = c.IdPacienteNavigation.DataNascimento,
                        NomePaciente = c.IdPacienteNavigation.NomePaciente,
                        Telefone = c.IdPacienteNavigation.Telefone,
                        Rg = c.IdPacienteNavigation.Rg,
                        Cpf = c.IdPacienteNavigation.Cpf,
                        Endereco = c.IdPacienteNavigation.Endereco,
                        IdUsuarioNavigation = new Usuario()
                        {
                            Nome = c.IdMedicoNavigation.IdUsuarioNavigation.Nome,
                            Email = c.IdMedicoNavigation.IdUsuarioNavigation.Email
                        }
                    },
                    IdSituacaoNavigation = new Situacao()
                    {
                      
                        IdSituacao = c.IdSituacaoNavigation.IdSituacao,
                        Situacao1 = c.IdSituacaoNavigation.Situacao1
                    }
                })
                .Where(p => p.IdMedicoNavigation.IdUsuario == idUsuario || p.IdPacienteNavigation.IdUsuario == idUsuario).ToList();
        }
    }
}
