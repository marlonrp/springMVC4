package br.com.caelum.contas.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import br.com.caelum.contas.dao.ContaDAO;
import br.com.caelum.contas.modelo.Conta;

@Controller
public class ContaController {
	
	private ContaDAO dao;

	@Autowired
	public ContaController(ContaDAO dao) {		
		this.dao = dao;
	}

	@RequestMapping("/form")
	public String formulario() {
		System.out.println("conta/formulario.jsp OK!");
		return "conta/formulario";
	}
	
	@RequestMapping("/adicionaConta")
	public String adiciona(@Valid Conta conta, BindingResult result) {
		
		if(result.hasFieldErrors("descricao")) {
			
			System.out.println("retornou conta/formulario ERROR!");
			return "conta/formulario";
		}
		
		System.out.println("Conta adicionada �: " + conta.getDescricao());
		
		dao.adiciona(conta);
		
		System.out.println("conta/conta-adicionada.jsp OK!");
		return "conta/conta-adicionada";
	}
	
	@RequestMapping("/removeConta")
	public String remove(Conta conta) {
		
		dao.remove(conta);
		
		System.out.println("conta/remove OK!");
		return "redirect:listaContas";
	}
	
	@RequestMapping("/pagaConta")
	public void paga(Conta conta, HttpServletResponse response) {
		
		dao.paga(conta.getId());
		
		System.out.println("conta/paga OK!");
		
		response.setStatus(200);
	}
	
	@RequestMapping("/listaContas")
	public ModelAndView lista() {
		
		List<Conta> contas = dao.lista();
		
		ModelAndView mv = new ModelAndView("conta/lista");
		mv.addObject("contas", contas);
		
		System.out.println("conta/lista.jsp OK!");
		return mv;
	}
	
}
