using Senai_SpMedicalGroup.Contexts;
using Senai_SpMedicalGroup.Domains;
using Senai_SpMedicalGroup.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Senai_SpMedicalGroup.Repositories
{
    public class ClinicaRepository: IClinicaRepository
    {
        MedicalGroupContext ctx = new MedicalGroupContext();

        public void AtualizarUrl(int idClinica, Clinica ClinicaAtualizada)
        {
            throw new NotImplementedException();
        }

        public Clinica BuscarPorId(int idClinica)
        {
            return ctx.Clinicas.FirstOrDefault(u => u.IdClinica == idClinica);
        }

        public void Cadastrar(Clinica novaClinica)
        {
            ctx.Clinicas.Add(novaClinica);

            ctx.SaveChanges();
        }

        public bool Deletar(int idClinica)
        {
            Clinica clinicaBuscada = BuscarPorId(idClinica);

            if (clinicaBuscada == null) return false;

            ctx.Clinicas.Remove(clinicaBuscada);

            ctx.SaveChanges();

            return true;
        }

        public List<Clinica> ListarTodos()
        {
            return ctx.Clinicas
                    .ToList();
        }
    }
}
