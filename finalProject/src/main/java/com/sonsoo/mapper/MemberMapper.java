package com.sonsoo.mapper;

import com.sonsoo.domain.MemberVO;

public interface MemberMapper {

	// 로그인하기
	public MemberVO getMember(MemberVO vo);
	
	// 회원가입하기
	public int join(MemberVO vo);
	
	// 아이디체크하기
	public MemberVO getMemberChk(MemberVO vo);
	
	// 회원정보수정창
	public MemberVO myinfo(MemberVO vo);

	// 회원정보수정하기
	public void mupdate(MemberVO vo);

	public void updateOmmitpassword(MemberVO vo);
	
	/*
	 * 로그인했을 때 생성되는 세션값을 넘기는 건 아님... public MemberVO myinfo(HttpSession session);
	 */
}
