package com.primeton.esb.interceptor.test;

import com.primeton.esb.model.IInterceptor4Service;
import com.primeton.esb.soap.inbound.model.IWebServiceInbound;
import com.primeton.tip.org.springframework.integration.core.Message;

public class SoapInboundRequest implements IInterceptor4Service<Message<?>, IWebServiceInbound>{

	@Override
	public void close() {
		// TODO 自动生成的方法存根
		
	}

	@Override
	public boolean isOpen() {
		// TODO 自动生成的方法存根
		return false;
	}

	@Override
	public void open() {
		// TODO 自动生成的方法存根
		
	}

	@Override
	public int afterHandle(Message<?> arg0, IWebServiceInbound arg1) {
		System.out.println("inbound request afterHandle");
		return 0;
	}

	@Override
	public int beforeHandle(Message<?> arg0, IWebServiceInbound arg1) {
		System.out.println("inbound request beforeHandle");
		return 0;
	}

}
