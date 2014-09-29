<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<style>
.error {
	color: red;
}
.jumbotron {
	background: #358CCE;
	color: #FFF;
	border-radius: 0px;
}
.jumbotron-sm { padding-top: 24px;
	padding-bottom: 24px; }
.jumbotron small {
	color: #FFF;
}
.h1 small {
	font-size: 24px;
}
.progress {    
    position: relative;
    height: 25px;
}
.progress > .progress-type {
    float:right;
    font-weight: 800;
    padding: 3px 30px 2px 10px;
    color: rgb(255, 255, 255);
    background-color: rgba(25, 25, 25, 0.2);
}
.progress > .progress-completed {
    position: absolute;
    right: 100px;
    font-weight: 800;
    padding: 3px 10px 2px;
}
.step {
	text-align: center;
	margin: 5px 10px 5px 10px;
}
.step .col-sm-3.col-xs-2:hover {
    color: #F58723;
    cursor: pointer;
}
.step .activestep {
    color: #F58723;
    border:3px solid #5CB85C;
    margin:5px 10px 5px 10px
    vertical-align: central;
    
}
.step .fa {
    padding: 10px 10px 10px 10px;
    margin:5px 5px 5px 5px;
    font-size: 40px;
}

.infot {
	color: #c0c0c0;
	float: left;
	font-weight: 800;
	font-size: 0.4cm;
}
.send-mail-div {
	text-align: center;
	height: 431px;
}
#page1 {
	margin-top: 100px;
	display: none;
}
#page2 {
	display: none;
}
#page3 {
	display: none;
}
#page4 {
	display: none;
}
#sigUp-body {
	text-align:center;
}
.user-column {
	margin-bottom: 0px;
	font-size: 0.6cm;
}
#sigUp-footer {
	margin: 0px auto;
}
hr {
	margin-top: 0px;
}
.post-div {
	float:left;
}
.agree-textarea {
	margin-bottom: 5px;
	resize: none;
}
@media(min-width:325px) {
	#page1 {
		margin-top: 0px;
	}
}
</style>

<body>
<BR>
	<div id="sigUp-body">
		<div id="page1" class="page1-div" >
			<h1>條約內容</h1>
			<div class="col-sm-8 col-sm-offset-2">
			<textarea rows="17" class="agree-textarea form-control" disabled >
			■第1條 目的
			以下條款和條件由本公司 TechWay 株式會社（以下簡稱「TechWay」）所負責企畫營運。
			關於本公司所提供線上遊戲服務UNLIGHT（以下簡稱「本服務」）
			所有的條約將對於本服務與使用者之間的各項服務進行限制。
			指定有關服務之間的服務和技術使用方式使用的基礎知識。
			 
			■第2條 本條約的規範以及變更
			本條約適用於使用 TechWay 本服務的所有使用者(以下簡稱「使用者」)
			使用者必續遵守本條約。
			本條約與本服務所規定之事項若有相抵觸之情形，以本服務中規定之事項為優先。
			使用者必須同意，TechWay 有權利無需事前經過使用者同意，隨時修正本條約。
			以及使用者於修正後利用本服務，將被視為同意本條約。
			使用者需定期確認服務公告以及本條約內容修正與否，無需經過 TechWay 的任何通知。
			對於使用者未定期確認其內容所發生的任何損失，TechWay 有權無需負責。
			 
			■第3條 本服務契約之成立
			使用者於登錄申請時需同意接受本條約規範。
			使用者於開始利用本服務申請後，TechWay 同意起本條約即成立。
			未成年使用者，需取得家長或法定監護人的同意，方能進行本服務使用申請。
			未成年使用者於使用申請的同時 TechWay 將視其為已經過家長或法定監護人同意。
			 
			■第4條 設備等準備
			使用本服務所需之相關通信器材，軟硬體設備，網際網路通信費用，需由使用者自行負擔。
			 
			■第5條 使用費
			使用者進行部分的服務內容時有可能需額外給付費用。
			使用費用以及付費方式如下
			 
			(1) 使用費用的變更
			TechWay 有權於任何時間調整使用費用，內容如下。
			本服務會於調整使用費用前進行公告，以公告內容日期為基準。
			關於使用費用之所有調整變更，將以本服務上之公告為準。
			 
			(2) 使用費用
			使用者於本服務上所需給付的使用費用，採事先給付方式。
			於本服務上所付款後的費用不予退費。
			以上包含所有具有爭議性的付費款項。
			 
			(3) 使用費用之計算方式
			使用者必須遵守 TechWay 及其付費服務商所訂之額外付費條件及費用。
			若使用者與第三方付費業者發生付費糾紛或爭議，使用者需自行與業者之間尋求解決之方式，
			TechWay 一概不予負責。
			 
			■第6條 使用者之禁止事項
			使用者進行本服務之同時，除使用條約以外，TechWay 另行制定的附加約定使用者都必須遵守。
			1.使用者進行本服務之同時，不得從事下列有關行為。
			(1) 脅迫，騷擾，或讓其他使用者感到困擾，身心受侵害之發言。
			(2) 情色聯想，種族歧視，政治性的發言，以及低俗，猥褻，重傷他人言論。
			(3) 對於其他使用者的毀謗，中傷，以及散博流言損害他人名譽之言論。
			(4) 假冒 TechWay 員工，或者相關公司之工作人員。
			(5) 商業性營利行為，物品販售，宣傳推銷等，危禁物品交換，招攬團體性或宗教性活動。
			(6) 國際法，憲法，法律，條例，以及其他法令相抵觸之行為。
			(7) 以不正當的手段竄改，刪除本服務公告之相關訊息內容，以及嘗試賭博之不正行為。
			(8) 擾亂妨礙本服務之通信，試圖不當手法侵入本服務營運相關伺服器竊取資訊之行為。
			(9) 利用病毒，任何其他不正當的電腦程式或情報網站意圖送信或竄改之行為
			擾亂妨礙本服務之通信，試圖不當手法侵入本服務營運相關伺服器竊取資訊之行為。
			(10) 對於宗教，人種，情色，民族，人權，組織活動，商業活動，或其他含有偏見的信條，
			或是以商業活動作為意圖的團體結成以及活動。
			(11) 懷有其他目的進行本服務的使用者。
			(12) 對他人或第三者的散佈個人情報。
			(13) 針對提供本服務的 TechWay 以及相關第三者的著作權，商標權等一切相關權利的侵權行為。
			(14) 使用者將自己所有的ID使用權以出借，轉讓，名義變更，買賣，抵押等方式交付第三者。　
			(15) 第三者利用使用者ID利用本服務
			(16) 違反公共秩序及善良風俗等行為
			(17) 與犯罪行為掛勾
			(18) 妨礙本服務營運等行為
			(19) 對 TechWay 以及本服務之管理者可能造成妨礙之行為 。
			(20) 利用程式漏洞進行不公正之行為或教唆他人利用。
			(21) 針對本程式進行破解，改造等詐欺行為。
			(22) 使用外掛程式或教唆他人使用
			(23) 在本服務上取得之道具，虛擬金錢的買賣以及其他有償行為。
			(24) 在同一IP的接續環境下妨礙遊戲進行或自導自演等非正當連結行為。
			(25) 利用本服務之漏洞或非預期疏失獲利，或對本公司以及其他會員造成不利等行為。
			(26) 符合前面各項條列內容之行為。
			(27) 除了前面各項條例內容外，有可能造成本服務管理人障礙之一切行為。
			(28) 前面各項條列之行為。
			2.有關使用者在本服務上所登錄之名稱，有以下限制：
			(1) 名人之名稱
			(2) 侵害登錄商標，著作權等智慧財產權之名稱
			(3) TechWay 以及其相關企業代表人或職員之名稱
			(4) 易造成第三者誤會之名稱
			(5) 違反本條款第一項內容之名稱
			(6) 其他經由 TechWay 所判定不適合之名稱
			3. 一旦確認有違本條款之複寫以及名稱後，TechWay 有權銷除其行為在本遊戲中的所有資訊。
			TechWay 毋需對違反本條款之使用者所產生的任何損害負責。
			 
			■第7條 關於本服務之使用停止
			TechWay 有權針對符合下列其中一條之使用者，停止其使用權利：
			(1) 違反或意圖違反本規約之使用者
			(2) 違反或意圖違反第6條禁止事項之使用者
			(3) 由 TechWay 所指定的結算公司認定無法提供結算或已停止結算服務之使用者
			(4) 提出破產或民事再生手續之使用者
			(5) 將使用者ID外流並造成本服務或第三者損害的不正當使用者
			(6) 其他妨害 TechWay 業務營運的行為。經由審查後 TechWay 有權停止使用者在本遊戲中
			之服務並註銷其所有相關資訊。
			 
			■第8條 關於本服務之使用以及終止契約
			距離最後一次使用時間六個月以上未登入的使用者，TechWay 有權停止本服務並取消與該
			使用者之間的使用契約。TechWay 有權變更使用者情報或註銷使用者資訊。
			使用者死亡後，TechWay 有權解除與該使用者之間的使用契約並停止解約前該使用者在本服
			務上所進行之所有權利。但是 TechWay 不負責使用者死亡之相關調查義務。
			TechWay 依照第７條之規定針對停止利用本服務之使用者以及在 TechWay 所發出催告書
			期限內未能解決催告事由之使用者，TechWay 有權在發出既定格式的通知後解除使用契約。
			除了本條第３項之外，針對符合第７條或第８條事由之使用者，TechWay
			可自行作出妨礙業務營運
			之判斷並終止使用契約，毋需事前通知使用者。
			TechWay 根據本條所載，毋須針對使用者因使用契約之解除變更所產生的損害負責。
			 
			■第9條 關於本服務之變更，終止，中斷
			TechWay 有權在未事先通知使用者的情況下針對本服務的所有或部分內容進變更或追加。
			TechWay 根據本條所載，毋須針對使用者因本服務變更所產生的損害負責。
			TechWay 可判斷自行終止本服務。TechWay 在本服務終止時需通知使用者其理由及判斷方法。
			TechWay 毋須針對使用者因本服務終止所產生的損害負責。
			TechWay 可基於下列事由，在未事前公告或通知使用者的情況下暫時性中斷本服務：
			(1) 本服務之軟硬體，通信設備等定期或緊急維修保固期間
			(2) 第1種和第2種通信業者無法提供服務期間
			(3) 天災等不可抗力因素
			(4) 火災，停電等事故發生時
			(5) 戰爭，紛爭，動亂，暴動，勞資糾紛等爭議發生時
			(6) 其他基於 TechWay 判斷必須暫時停止服務時
			TechWay 根據本條所載，毋須針對使用者因本服務暫時中斷所產生的損害負責。
			 
			■第10條 免責事項
			本服務有可能因機器故障，事故，停電所造成通信線路異常等不可抗力因素或系統障礙
			導致使用者資訊遺失。除了故意或重大過失情節之外，TechWay 毋須對使用者因為
			不可抗事件所造成使用者資料的遺失，缺漏或延遲等損害負責。
			 
			使用者不論是否為本人所為，應對其使用者ID在本服務上所產生的一切行為及結果負責。
			使用者不論是否利用本服務，均應對其行為結果負責。在使用本服務時造成 TechWay
			或第三者的損害時，使用者應負賠償責任。
			使用者必須依自己的判斷，基於維持健全生活環境的原則適當使用本服務。
			使用者因自身不適當的使用所造成社會上，精神上，肉體上的損害，TechＷay毋須負責。
			經由TechＷay的自行判斷，TechＷay有權自由利用使用者在本服務上所發布的情報。
			使用者針對該行為不得請求對價報酬或行使著作者人格權。
			除了故意或重大過失情節之外，TechWay 對使用者在利用本服務時所發生的損害
			（延遲，通訊障礙，error，系統當機，傳送失敗，因服務中斷所造成的資訊，
			項目，文字的消失，使用者端的故障，錯誤操作等其他一切損害）毋須負責。
			 
			TechWay 在本服務中段期間使用者所負擔的一切費用（電話費，本服務之使用費等）
			無支付義務。針對利用本服務時所發生的系統錯誤，TechWay 毋需對使用者以及第三者負責。
			此外，本服務為 TechWay 在現時點所能提供之服務內容。TechWay 無法對使用者保證本服務
			毫無缺陷，敬請見諒。
			TechWay 對使用者在利用本服務時所獲得情報（包含電腦程式）的完全性，正確性，適用性，
			有用性等方面毋須負責。
			 
			TechWay 對使用者在利用本服務時，使用者與第三者之間所發生的利益糾紛
			（本軟體之外因其他軟體，資訊，硬體等所發生之一切損害）毋須負責。
			TechWay 有權針對使用者在利用本服務時，對 TechWay 所造成損害的行為責任進行求償。
			使用者在利用本服務時與第三者所發生的糾紛費用則需自行負擔，TechWay 毋須負責。
			倘若 TechWay 因使用者所引發之事件被其他使用者或第三者追究相關責任時，使用者應負擔相
			關費用。此時 TechWay 有權向使用者請求適當的律師費用。
			除了故意或重大過失情節之外，TechWay 經由本規定所產生的行為結果，已及使用者在利用本服
			務時所產生的行為結果，針對使用者及其他第三者，不論原因，
			TechWay 毋須對其行為結果負責。
			 
			■第11條 商標等
			本服務中所使用之商標，LOGO，及其相關之標章(統稱「商標」)還未登記。
			TechWay 依本規約不對使用者或其他第三者進行該商標之讓渡或使用承諾，使用者不得對
			未登錄商標進行登錄。
			此外，使用者無權針對本服務的專利權，實用新型權，意匠權，商標權等登錄申請以及著作權
			（程是權利，檔案權利，排程，組件等權利）之權利登陸或轉移登錄進行申請或行使相關權利。
			 
			■第12條 法規
			本條約以及其相關法律皆以日本國法為基準，所有條款皆遵循日本國法釋法。
			 
			■第13條 管轄裁判所
			本服務相關之任何，TechWay 與使用者之間所發生之糾紛，雙方應持誠意協商。
			倘若發生無法協商之情形，即由東京簡易裁判所，審理判決。
			
			本條約由2011年4月26日起實施
			</textarea>
			<button type="button" class="btn btn-default" id="agree">我同意</button>
			<button type="button" class="btn btn-default" id="onAgree">不同意</button>
			</div>
			
			
		</div>
		<div id="page2"><!-- 
			<div class="jumbotron jumbotron-sm">
				<div class="container">
					<div class="row">
						<div class="col-sm-12 col-lg-12">
							<h1 class="h1">
								小賭怡情,大賭養家 <small>希望無窮</small>
							</h1>
						</div>
					</div>
				</div> 
			</div>-->

			<div class="container">
				<div class="row">
					<div class="col-md-8">
						<div class="well well-sm">
							<form id="registration-form">
								<div class="row">
									<div class="col-md-6">
										<div class="form-group has-feedback">
											<label  for="accountf">帳號</label>
											<div class="input-group">
												<span class="input-group-addon">
													<span class="glyphicon glyphicon-user"></span> 
												</span> 
												<input type="text" class="input-sm form-control" id="accountf" name="model.userAccount"
												placeholder="輸入帳號"  />
											</div>
											<span class="glyphicon form-control-feedback"></span>
											<div class="errorMsg"></div>
										</div>
										<div class="form-group has-feedback">
											<label  for="passwordf">密碼</label>
											<div class="input-group">
												<span class="input-group-addon">
													<span class="glyphicon glyphicon-lock"></span> 
												</span> 
												<input type="password" class="input-sm form-control" id="passwordf" name="userPassword"
												placeholder="輸入密碼" />
											</div>
											<span class="glyphicon form-control-feedback"></span>
											<div class="errorMsg"></div>
										</div>
										
										<div class="form-group has-feedback">
											<label  for="confirm_password">確認密碼</label>
											<div class="input-group">
												<span class="input-group-addon">
													<span class="glyphicon glyphicon-check"></span> 
												</span> 
												<input type="password" class="input-sm form-control" id="confirm_password"
													name="confirm_password" placeholder="確認密碼" />
											</div>
											<span class="glyphicon form-control-feedback"></span>
											<div class="errorMsg"></div>
										</div>
										<div class="form-group has-feedback">
											<label for=userBirth>生日</label>
											<div class="input-group">
												<span class="input-group-addon">
													<span class="glyphicon glyphicon-calendar"></span> 
												</span> 
												<input type="text" class="input-sm form-control" id="userBirth"
													name="model.userBirthday" placeholder="日期"/>
											</div>
											<span class="glyphicon form-control-feedback"></span>
											<div class="errorMsg"></div>
										</div>
										<div class="form-group has-feedback">
											<label for="email">信箱</label>
											<div class="input-group">
												<span class="input-group-addon">
													<span class="glyphicon glyphicon-envelope"></span> 
												</span> 
												<input type="email" class="input-sm form-control" id="email"
													name="model.userEmail" placeholder="user@email.com" />
											</div>
											<span class="glyphicon form-control-feedback"></span>
											<div class="errorMsg"></div>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group has-feedback">
											<label for="name">姓名</label>
											<div class="input-group">
												<span class="input-group-addon">
													<span class="glyphicon glyphicon-pencil"></span> 
												</span> 
												<input type="text" class="input-sm form-control" id="name" name="model.userName"
												placeholder="輸入姓名" />
											</div>
											<span class="glyphicon form-control-feedback"></span>
											<div class="errorMsg"></div>
										</div>
										
										<div class="form-group has-feedback">
											<label for="userId">身分證</label>
											<div class="input-group">
												<span class="input-group-addon">
													<span class="glyphicon glyphicon-tag"></span> 
												</span> 
												<input type="text"class="input-sm form-control" id="userId" name="model.userCardId"
												placeholder="輸入號碼" />
											</div>
											<span class="glyphicon form-control-feedback"></span>
											<div class="errorMsg"></div>
										</div>
										
										<div class="form-group">
											<label for="phone">電話</label>
											<div class="input-group">
												<span class="input-group-addon">
													<span class="glyphicon glyphicon-phone"></span> 
												</span> 
												<input type="text" class="input-sm form-control" id="phone" name="model.userPhone"
												placeholder="輸入號碼" />
											</div>
											<span class="glyphicon"></span>
											<div class="errorMsg"></div>
										</div>
										
										<div>
											<label for="ba">匯款帳號</label>&nbsp;
											<select name="select-transfer" class="input-sm" id="select-transfer">
											  	<option value="POST">郵局帳戶</option>
											  	<option value="BOT">台灣銀行</option>
											</select>
											<div class="post-div top10">
												<input name="post1" class="post1 input-sm" size="5" type="text" placeholder="局號" onKeyUp="next(this,6,'.post2')">&nbsp;
												<input name="post2" class="post2 input-sm" size="1.6" type="text" placeholder="檢號" onKeyUp="next(this,1,'.post3')">&nbsp;
												<input name="post3" class="post3 input-sm" size="5" type="text" placeholder="帳號" onKeyUp="next(this,6,'.post4')">&nbsp;
												<input class="post4 input-sm" size="1.6" type="text" placeholder="檢號" name="post4">&nbsp;
											</div>
											<div class="bot-div">
												<input type="text" class="input-sm form-control" placeholder="xxxx-xxxx-xxxx-xxxx" />
											</div>
											<input type="text" class="input-sm" id="credit" name="model.userBankAccount" style="display:none;"/>
											<div class="errorMsg"></div>
										</div>
									</div>
									<div class="col-md-12">
										<button class="btn btn-primary pull-right" id="addUserButton" data-loading-text="Loading...">送出</button>
									</div>
								</div>
							</form>
						</div>
					</div>
					<div id="info-form" class="col-md-4 hidden-xs">
						<form>
							<legend>
								<span class="glyphicon glyphicon-user"></span>  
								<abbr id="info-account" title="預覽資料"></abbr> 
								<span id="info-name"></span><br>
							</legend>
							<address>
								<div>
									<p>
										<span class="infot">身分證:</span>
										<span class="user-column" id="info-idcard">&nbsp;</span> 
									</p>
								</div>
								<HR>
								<div>
									<p>
										<span class="infot">生日 :</span> 
										<span class="user-column" id="info-birth">&nbsp;</span> 
									</p>
								</div>
								<HR>
								<div>
									<p>
										<span class="infot">E mail :</span> 
										<a class="user-column" id="info-mail" href="mailto:#">&nbsp;</a>
									</p>
								</div>
								<HR>
								<div>
									<p>
										<span class="infot">電話 :</span> 
										<span class="user-column" id="info-phone">&nbsp;</span> 
									</p>
								</div>
								<HR>
								<div>
									<p>
										<span class="infot">匯款帳號 :</span> 
										<span class="user-column" id="info-card">&nbsp;</span> 
									</p>
								</div>
								<HR>

							</address>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div id="page3">
			<div class="send-mail-div">
				<h1>請輸入驗證碼</h1>
				<input name="lockCharacter" id="lockCharacter" type="text" ><br>
				<div>
					<button class="btn btn-primary">驗證</button>
					<button class="btn btn-warning" data-loading-text="送信中...">重寄</button>
				</div>
				<div class="onlock-error-div"></div>
			</div>
		</div>
		<div id="page4">
			<div class="send-mail-div">
				<div style="font-size:2em">${user.userName}感謝您的註冊您可以開始。。。↓</div>
				<img src="<c:url value='/images/gameValidate.JPG'/>" alt="玩法介紹">
			</div>
		</div>
	</div>

	<div id="sigUp-footer" class="row container">
    <div class="footer-body">
	    <div class="row">
	        <div class="progress" id="progress1">
	            <div class="progress-bar" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 10%;">                
	            </div>
	            <span class="progress-type">完成</span>
	            <span class="progress-completed">10%</span>
	        </div>      
	    </div>

        <div class="row">
            <div class="row step">
                <div id="step1" class="fa fa-check-square-o col-sm-3 col-xs-2 activestep">
                </div>
                <div class="fa fa-arrow-right col-sm-1 col-xs-1">               
                </div>
                <div id="step2" class="fa fa-pencil col-sm-3 col-xs-2" >
                </div>
                <div class="fa fa-arrow-right col-sm-1 col-xs-1">
                </div>
                <div id="step3" class="fa fa-envelope-o col-sm-3 col-xs-2">
                </div>
            </div>
        </div>
        

    </div>
</div>
</body>

<script src="<c:url value='/Security/js/jquery.validate.min.js'/>"></script> 
<script type="text/javascript">
$(window).off('resize');

function next(obj,n,next) {
	(function($) {
		if(obj.value.length==n) {
			$(next).focus();
		}
	})(jQuery);
}

	(function($) {
		//window.document.body.onbeforeunload = function() {
		//    return '您尚未將編輯過的表單資料送出，請問您確定要離開網頁嗎？';
		//};
		
		$('#onAgree').click(function() {
			document.location.href="http://mymuse.nmns.edu.tw/children/";
		});
		

		$('.bot-div').hide();
		$('#select-transfer').change(function(e) {
			var optionSelected = $(this).find("option:selected");
			var valueSelected = optionSelected.val();
			//console.log(valueSelected);
			switch (valueSelected) {
			case 'POST':
				$('.post-div').show();
				$('.bot-div').hide();
				break;
			case 'BOT':
				$('.bot-div').show();
				$('.post-div').hide();
				break;

			}
		});

		//帳號重複與驗證
		jQuery.validator.addMethod("alnum", function(value, element) {
			return this.optional(element) || /^[a-zA-Z0-9]+$/.test(value);
		}, "只能包括英文字母和数字");
		jQuery.validator.addMethod("checkAccount", function() {
			$('#info-account').html($('#accountf').val());
			$.ajax({
				url : "<c:url value='/checkAccount'/>",
				type : "get",
				data : {
					'model.userAccount' : $('#accountf').val()
				},
				async : false,
				success : function(data) {
					if (data == "success") {
						checeAccount = true;
					} else {
						checeAccount = false;
					}
				}
			});
			return checeAccount;
		}, "帳號重複!");

		//驗證Email
		jQuery.validator.addMethod("checkEmail", function() {
			$('#info-mail').html($('#email').val());
			$.ajax({
				url : "<c:url value='/checkEmail'/>",
				type : "get",
				data : {
					'model.userEmail' : $('#email').val()
				},
				async : false,
				success : function(data) {
					if (data == "success") {
						checeEmail = true;
					} else {
						checeEmail = false;
					}
				}
			});
			return checeEmail;
		}, "Email已使用過");

		//密碼規則驗證
		jQuery.validator.addMethod("checkPsw1", function() {
			var re1 = /^(?!.*[\u4E00-\u9FA5])(?=.*[0-9])\S{6,}$/g;
			var password = $('#passwordf').val();
			//var password = $('#passwordf').val().replace(/ /g, "");
			if (re1.test(password)) {
				checkPsw1 = true;
			} else {
				checkPsw1 = false;
			}
			return checkPsw1;
		}, "須包含數字");
		jQuery.validator.addMethod("checkPsw2", function() {
			var re2 = /^(?!.*[\u4E00-\u9FA5])(?=.*[a-zA-Z])\S{6,}$/g;
			if (re2.test($('#passwordf').val())) {
				checkPsw2 = true;
			} else {
				checkPsw2 = false;
			}
			return checkPsw2;
		}, "須包含英文");
		jQuery.validator.addMethod("alnumpwd", function(value, element) {
			return this.optional(element) || /^[a-zA-Z0-9]+$/.test(value);
		}, "只能包括英文字母和数字");

		//姓名電話
		jQuery.validator.addMethod("input", function() {
			$('#info-name').text("(" + $('#name').val() + ")");
			$('#info-phone').html("<p>&nbsp" + $('#phone').val() + "</p>");
			return true;
		});
		jQuery.validator.addMethod("alnumName", function(value, element) {
			return /^[\u4E00-\u9FA5]+$/.test(value);
		}, "只能輸入中文");

		//身分證驗證
		jQuery.validator.addMethod("idCard", function() {
			var citizenid = $('#userId').val().toUpperCase();
			var local_table = [ 10, 11, 12, 13, 14, 15, 16, 17, 34, 18, 19, 20,
					21, 22, 35, 23, 24, 25, 26, 27, 28, 29, 32, 30, 31, 33 ];
			var local_digit = local_table[citizenid.charCodeAt(0)
					- 'A'.charCodeAt(0)];
			var checksum = 0;
			checksum += Math.floor(local_digit / 10);
			checksum += (local_digit % 10) * 9;
			for (var i = 1, p = 8; i <= 8; i++, p--) {
				checksum += parseInt(citizenid.charAt(i)) * p;
			}
			checksum += parseInt(citizenid.charAt(9));
			return !(checksum % 10);
		}, "無此身分證");
		jQuery.validator.addMethod("idCardLayout", function() {
			var citizenid = $('#userId').val().toUpperCase();
			citizenid = citizenid.replace(/\s+/g, "");
			return /^[A-Z]{1}[1-2]{1}[0-9]{8}$/.test(citizenid);
		}, "格式不正確");
		jQuery.validator.addMethod("checkIdCard", function() {
			$('#info-idcard').html($('#userId').val().toUpperCase());
			var check = false;
			$.ajax({
				url : "<c:url value='checkUserCardId' />",
				type : 'get',
				async : false,
				data : {
					'model.userCardId' : $('#userId').val()
				},
				success : function(data) {
					if (data == "success") {
						check = true;
					}
				}
			});
			return check;
		}, "身分證重複");
		
		//年齡驗證
		jQuery.validator.addMethod('checkBirth', function() {
			$('#info-birth').text($('#userBirth').val());
			var check = true;
			var userBirth = $("#userBirth").val();
			var year = new Date().getFullYear();
			var month = new Date().getMonth() + 1;
			var day = new Date().getDate();
			var res;
			if (userBirth.substring(4, 5) == '/') {
				res = userBirth.split("/");
			} else {
				res = userBirth.split("-");
			}
			if ((year - res[0]) < 18) {
				check = false;
			} else if ((year - res[0]) == 18 && (res[1] - month) > 0) {
				check = false;
			} else if ((year - res[0]) == 18 && (res[1] - month) == 0
					&& (res[2] - day) > 0) {
				check = false;
			}
			return check;
		}, function() {
			var res;
			var month = new Date().getMonth() + 1;
			var userBirth = $("#userBirth").val();
			var year = new Date().getFullYear();
			var day = new Date().getDate();
			if (userBirth.substring(4, 5) == '/') {
				res = userBirth.split("/");
			} else {
				res = userBirth.split("-");
			}
			year = 18 - (year - res[0]);
			month = res[1] - month;
			day = res[2] - day ;
			if (year == 0 && month == 0) {
				return "再忍耐" + day + "天再來註冊!";
			} else if (year == 0) {
				return "快了快了,剩" + month + "個月就能來了";
			}
			return "別急別急,再等" + year + "年再來";
		});
		
		//匯款帳號驗證
		jQuery.validator.addMethod('postCheck', function() {
			var bankAccount = $('.post1').val() + "-" + $('.post2').val()
								+ "-" + $('.post3').val() + "-" + $('.post4').val();
			$('#credit').val(bankAccount);
			$('#info-card').html(" " + $('#credit').val());
			//console.log(bankAccount.replace(/-/g, ""));
			var check=false;
			bankAccount = bankAccount.replace(/-/g, "");
			if(isNaN(bankAccount) || bankAccount.length!=14 ||
					/[Ee]/.test(bankAccount)) {
				check = false;
			}else {
				check = true;
			}
			return check;
		},"格式錯誤,請檢查");
		$('#registration-form').validate(
				{
					errorPlacement: function(error, element) {
						var parent = element.parent().parent();
						$('div.errorMsg',parent).html(error);
					},
					debug : true,
					rules : {
						'model.userAccount' : {
							minlength : 6,
							required : true,
							checkAccount : true,
							alnum : true
						},
						userPassword : {
							required : true,
							minlength : 6,
							alnumpwd : true,
							checkPsw1 : true,
							checkPsw2 : true
						},
						confirm_password : {
							required : true,
							minlength : 6,
							equalTo : "#passwordf"
						},
						'model.userEmail' : {
							required : true,
							email : true,
							checkEmail : true
						},
						'model.userBirthday' : {
							dateISO : true
						},
						'model.userName' : {
							required : true,
							alnumName : true,
							input : true
						},
						'model.userCardId' : {
							required : true,
							idCardLayout : true,
							idCard : true,
							checkIdCard : true
						},
						'model.userBirthday' : {
							required : true,
							dateISO : true,
							checkBirth : true
						},
						'model.userPhone' : {
							required : true,
							number : true,
							maxlength : 14,
							input : true
						},
						post4 : {
							postCheck : true 
						}
					},
					highlight : function(element) {
						//console.log('fail');
						var formGroup = $(element).closest('.form-group');
						formGroup.removeClass('has-success').addClass(
								'has-error');
						$('.form-control-feedback', formGroup).removeClass(
								'glyphicon-ok').addClass('glyphicon-remove');
						$('div.errorMsg',formGroup).show();
					},
					success : function(element) {
						//console.log("success");
						var formGroup = $(element).closest('.form-group');
						formGroup.removeClass('has-error').addClass(
								'has-success');
						$('.form-control-feedback', formGroup).removeClass(
								'glyphicon-remove').addClass('glyphicon-ok');
						$('.error', formGroup).hide();
						$('div.errorMsg',formGroup).hide();
					},
				});
		$('#addUserButton').on('click',function() {
			if($('#registration-form').valid()) {
				$(this).button('loading');
				$.ajax({
					url : "<c:url value='/addAccount'/>",
					type : "post",
					data : {
					async : false,
						'model.userAccount' : $('#accountf').val(),
						userPassword : $('#passwordf').val(),
						'confirm_password' : $('#confirm_password').val(),
						'model.userBirthday' : $('#userBirth').val(),
						'model.userEmail' : $('#email').val(),
						'model.userName' : $('#name').val(),
						'model.userCardId' : $('#userId').val().toUpperCase(),
						'model.userPhone' : $('#phone').val(),
						'model.userBankAccount' : $('#credit').val()
					},
					complete : function() {
						$('#addUserButton').button('reset');
					},
					success : function(data) {
						//console.log(data);
						if (data == "success") {
							sendLockMail();
							$('#page2').hide();
							document.location.href="<c:url value='/lottery'/>";
						}else {
							//
						}
					}
				});
			}
		});
			
		function sendLockMail() {
			$.ajax({
				url : "<c:url value='/sendLock'/>"
			});
		}

		//日期選擇器
		$('#userBirth').datepicker({
			format : "yyyy-mm-dd",
			startView : 2,
			endDate : "now",
			language : "zh-TW",
			keyboardNavigation : false
		});

		if('${empty user}'=='true') {
			$('#page1').fadeIn(500);
		}else {
			$('#page3').fadeIn(500);
			$(".progress-bar").css("width", "92.9%").attr(
					"aria-valuenow", 90);
			$(".progress-completed").text(90 + "%");
			$('#step1').removeClass("activestep");
			($('#step3').addClass("activestep")).fadeIn(500);
		}
		
		$('#agree').on(
				'click',
				function() {
					$('#step1').removeClass("activestep");
					($('#step2').addClass("activestep")).fadeIn(500);
					$('#page1').hide();
					$('#page2').fadeIn(500);
					$(".progress-bar").css("width", "50%").attr(
							"aria-valuenow", 50);
					$(".progress-completed").text(50 + "%");
				});
		$('.btn-primary','.send-mail-div').on('click',function() {
			$.ajax({
				url : "<c:url value='/verify'/>",
				type : "get",
				async : false,
				data : {
					lockCharacter:$('#lockCharacter').val()
				},
				success : function(data) {
					if (data == "success") {
						$('#top-page-div').load('<c:url value="/topPage.jsp"/>');
						$(".progress-bar").css("width", "100%").attr(
								"aria-valuenow", 100);
						$(".progress-completed").text(100 + "%");
						$('#step1').removeClass("activestep");
						$('#page3').hide();
						$('#page4').fadeIn(500);
					}else {
						$('.onlock-error-div').html('驗證失敗,請重新填入').css('color','red');
					}
				}
			});
		});
		$('.btn-warning','.send-mail-div').on('click',function() {
			var btn = $(this);
		    btn.button('loading');
			$.ajax({
				url : "<c:url value='/sendLock'/>",
				type : "get",
				complete : function() {
					btn.button('reset');
				},
				success : function(data) {
					if (data == "success") {
						$('.onlock-error-div').html('驗證信已重新寄出,請查看').css('color','green');
					}else {
						$('.onlock-error-div').html('發送失敗請檢查帳號與Email').css('color','red');
					}
				}
			});
		});
		
	})(jQuery);
</script>
</html>