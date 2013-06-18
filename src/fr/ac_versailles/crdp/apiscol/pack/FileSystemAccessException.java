package fr.ac_versailles.crdp.apiscol.pack;


import fr.ac_versailles.crdp.apiscol.ApiscolException;


public class FileSystemAccessException extends ApiscolException {
	
	private static final long serialVersionUID = 1L;

	public FileSystemAccessException(String message) {
		super(message);
	}
}
