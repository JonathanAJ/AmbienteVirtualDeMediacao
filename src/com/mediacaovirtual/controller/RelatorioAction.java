package com.mediacaovirtual.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.itextpdf.io.font.FontConstants;
import com.itextpdf.io.image.ImageDataFactory;
import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Image;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Table;
import com.itextpdf.layout.property.HorizontalAlignment;
import com.itextpdf.layout.property.TextAlignment;
import com.mediacaovirtual.dao.RelatorioDAO;
import com.mediacaovirtual.model.Usuario;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class RelatorioAction extends ActionSupport{
	
	private Usuario usuario;
	private String tipo;
	
	private String filePath = "/home/jonathan/relatorio-sistema.pdf";
	private InputStream inputStream;
	private RelatorioDAO relatorioDAO = new RelatorioDAO();
	private List<Object[]> lista;
	
	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}
	
	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public String getContentDisposition(){
		File f = new File(filePath);
		return "attachment;filename=" + f.getName();
	}
	
	public String download() throws Exception{
		System.out.println(getTipo());
		if(getTipo().equals("Nucleo")){
			geraPDFRelatorio("Nucleo");	
		}
		else if(getTipo().equals("Pessoal")){
			geraPDFRelatorio("Pessoal");	
		}
		else{
			geraPDFRelatorio("");
		}
		
		if(filePath != null){
			File f = new File(filePath);
			inputStream = new FileInputStream(f);
			return "sucesso";
		}
		return "erro";
	}

	public void geraPDFRelatorio(String tipoRelatorio) throws Exception{
		PdfWriter writer = new PdfWriter(filePath);
		PdfDocument pdf = new PdfDocument(writer);
		Document doc = new Document(pdf);
		
		PdfFont helvB = PdfFontFactory.createFont(FontConstants.HELVETICA_BOLD);
		
		Image logo = new Image(ImageDataFactory.create("http://localhost:8080/AmbienteVirtualDeMediacao/img/logo.png"));
		logo.setHorizontalAlignment(HorizontalAlignment.CENTER);
		logo.setWidth(70);
		logo.setMarginBottom(20);
		
		Paragraph titulo = new Paragraph();
		titulo.add("Ambiente Virtual de Mediação e Conciliação");
		titulo.setFontSize(16);
		titulo.setFont(helvB);
		titulo.setTextAlignment(TextAlignment.CENTER);
		
		Paragraph tipo = new Paragraph();
		tipo.setFontSize(16);
		tipo.setFont(helvB);
		tipo.setItalic();
		tipo.setTextAlignment(TextAlignment.CENTER);
		tipo.setMarginBottom(30);
		
		float[] grid = {5, 3, 3, 2};
		Table tabela = new Table(grid);
		tabela.setWidthPercent(100);
		tabela.addHeaderCell(new Paragraph("Núcleo").setFont(helvB));
		tabela.addHeaderCell(new Paragraph("Mediador").setFont(helvB));
		tabela.addHeaderCell(new Paragraph("Tipo de Caso").setFont(helvB));
		tabela.addHeaderCell(new Paragraph("Data").setFont(helvB));
		
		if(tipoRelatorio.equals("Nucleo")){
			tipo.add("Relatório Núcleo do Sistema");
			tabela = getTabelaRelatorio(tabela, tipoRelatorio);	
		}
		else if(tipoRelatorio.equals("Pessoal")){
			tipo.add("Relatório Pessoal do Sistema");
			tabela = getTabelaRelatorio(tabela, tipoRelatorio);
		}
		else {
			tipo.add("Relatório Geral do Sistema");
			tabela = getTabelaRelatorio(tabela, tipoRelatorio);
		}
		doc.add(logo);
		doc.add(titulo);
		doc.add(tipo);
		doc.add(tabela);
		
		doc.close();
	}
	
	public Table getTabelaRelatorio(Table tabela, String tipoRelatorio){
		usuario = (Usuario) ActionContext.getContext().getSession().get("usuario");
		
		if(tipoRelatorio.equals("Nucleo")){
			lista = relatorioDAO.getRelatorioNucleo(usuario.getNucleo().getId());	
		}
		else if(tipoRelatorio.equals("Pessoal")){
			lista = relatorioDAO.getRelatorioPessoal(usuario.getId());
		}
		else {
			lista = relatorioDAO.getRelatorioGeral();
		}
		for(Object[] obj : lista){
			tabela.addCell(obj[0].toString());
			tabela.addCell(obj[1].toString());
			tabela.addCell(obj[2].toString());
			// O objeto 3 é do tipo Date
			Date data = (Date) obj[3];
			String dataFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm").format(data);
			tabela.addCell(dataFormat);
		}
		return tabela;
	}
	
}
